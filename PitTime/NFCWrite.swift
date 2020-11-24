//
//  NFCWrite.swift
//  PitTime
//
//  Created by 神村亮佑 on 2020/11/24.
//


import SwiftUI
import CoreNFC
import UIKit


class NFCSessionWrite : NSObject, NFCNDEFReaderSessionDelegate{
    
    //MARK: PROPERTIES
    var session : NFCNDEFReaderSession?
    
    
    //MARK: PUBLIC FUNCTIONS
    public func  beginScanning(){
        guard NFCNDEFReaderSession.readingAvailable else{
            print("スキャンに対応されていない機種です。申し訳ございません。")
            return
        }
        session = NFCNDEFReaderSession(delegate: self, queue: .main, invalidateAfterFirstRead: false)
        session?.alertMessage = "データを書き込むのでNFCタグに近づけてください"
        session?.begin()
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
        // Do nothing here unless you want to impletent error
    }
    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        // Do nothing here
    }
    func readerSessionDidBecomeActive(_ session: NFCNDEFReaderSession) {
        // This is to silence console.
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didDetect tags: [NFCNDEFTag]) {
        if tags.count > 1 {
            //restart session for 2 seconds
            let retryInterval = DispatchTimeInterval.milliseconds(2000)
            session.alertMessage = "1個以上のタグが見つかります。もう一度お試しください"
            DispatchQueue.global().asyncAfter(deadline: .now() + retryInterval, execute: {
                session.restartPolling()
            })
            return
        }
        
        let tag = tags.first!
        session.connect(to: tag){ (error) in
            if error != nil {
                session.alertMessage = "NFCタグに書き込むことが出来ませんでした。もう一度お試しください"
                session.invalidate()
                print("ERROR CONNECTED")
                return
            }else{
                // Query tag if no error occur
                tag.queryNDEFStatus {(ndefStatus, capacity, error) in
                    if error != nil {
                        session.alertMessage = "NFCタグを照会することができません🙄"
                        session.invalidate()
                        print("ERROR QUERY TAG")
                        return
                    }
                    
                    //proceed to query
                    switch ndefStatus {
                    case .notSupported:
                        print("Not Supoort")
                        session.alertMessage = "Tag is not NDEF complaint"
                        session.invalidate()
                    case .readWrite:
                        // Writing code logic
                        print("Read Write")
                        let payLoad : NFCNDEFPayload?
                        
                        // MARK: - Date を読み取り書き込む
                        let currentTime = self.getCurrentTime()
                        
                        payLoad = NFCNDEFPayload(
                            format: .nfcWellKnown,
                            type: "T".data(using: .utf8)!,
                            identifier: "Text".data(using: .utf8)!,
                            payload: currentTime.data(using: .utf8)!
                        )

                        //make our message array
                        let nfcMessage = NFCNDEFMessage(records: [payLoad!])
                        print("\(nfcMessage)")
                        
                        // write to tag
                        tag.writeNDEF(nfcMessage) { (error) in
                            if error != nil {
                                session.alertMessage = "WRITE NFC FAIL: \(error!.localizedDescription)"
                                print("fail write : \(String(describing: error?.localizedDescription))")
                            } else {
                                
                                // to write
                                session.alertMessage = "書き込むことに成功しました！"
                                print("SUCCESS WRITE!!")
                            }
                            session.invalidate()
                        }
                        
                        
                    case .readOnly:
                        print("Read Only")
                        session.alertMessage = "Tag is read only."
                        session.invalidate()
                        
                    @unknown default:
                        print("Unkwon error")
                        session.alertMessage = "Unknown NDEF tag status"
                        session.invalidate()
                        
                    }
                }
                
            }
            }
            
    }
    
    //MARK: PRIVATE FUNCTIONS
    private func getCurrentTime() -> String {
        let time = Date()
        print("CURRENT TIME = \(time)")
        let currentTime = DateUtils.stringFromDate(date: time, format: "yyyy年MM月dd日 HH時mm分ss秒 Z")
        return currentTime
    }
    
    private func notSupported(session: NFCNDEFReaderSession) {
        print("Not Supoort")
        session.alertMessage = "Tag is not NDEF complaint"
        session.invalidate()
    }
}

