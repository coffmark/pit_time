//
//  DataService.swift
//  PitTime
//
//  Created by 神村亮佑 on 2020/11/24.
//

import Foundation
import RealmSwift
import SwiftUI

class RealmDataService {
    
    //MARK: PROPERTIES
    static let instance = RealmDataService()
    
    
    //MARK: FUNCTIONS
    func StoreRealmDB(currentTime: String) {
        let time = Time()
        time.time = currentTime
        
        print(time.time)
        let realm = try! Realm()
        try! realm.write {
            realm.add(time)
        }
    }
    
    func fetchRealmDB() {
        do {
            let realm = try Realm()
            let times = realm.objects(Time.self)
            for t in times{
                print("TIME: \(t.time)")
            }
        } catch let error as NSError {
            print("NSERROR : \(error)")
        }
        
    }
}
