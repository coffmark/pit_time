//
//  1Document.swift
//  PitTime
//
//  Created by 神村亮佑 on 2020/12/22.
//

import Foundation
import SwiftUI
import UniformTypeIdentifiers

// struct MessageDocument: FileDocument {
//    static var readableContentTypes: [UTType] { [.commaSeparatedText] }
//
//    var message: String
//    var currentUserID: String?
//
//    init(message: String, currentUserID: String?){
//        self.message = message
//        self.currentUserID = currentUserID
//    }
//
//    init(configuration: ReadConfiguration) throws {
//        guard let data = configuration.file.regularFileContents,
//              let string = String(data: data, encoding: .utf8)
//        else {
//            throw CocoaError(.fileReadCorruptFile)
//        }
//        if let userID = currentUserID {
//            message = DataService.instance.downloadAndExportPitTime(userID: userID)
//            message = string
//        }else{
//            print("Error: userID IS nil")
//        }
//    }
//
//    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
//        FileWrapper(regularFileWithContents: message.data(using: .utf8)!)
//    }
// }
