//
//  DataBase.swift
//  WheatherAppIOS
//
//  Created by Rustam Keneev on 6/10/21.
//

import Foundation
import RealmSwift

class DataBase {
    
    private var realm: Realm? = nil
    
    init() {
        do {
            try realm = Realm()
        } catch {
            print("DataBase not Realm init")
        }
    }
    
    func saveModel<T: Object>(model: T) {
        do {
            try realm?.write {
                realm?.add(model)
            }
        } catch {
            print("DataBase saveSearchModel not work")
        }
    }
    
    func getModel<T: Object>() -> Results<T>? {
         return realm?.objects(T.self)
    }
}
