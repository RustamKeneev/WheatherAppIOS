//
//  DataBaseRepository.swift
//  WheatherAppIOS
//
//  Created by Rustam Keneev on 6/10/21.
//

import Foundation
import RealmSwift

class DataBaseRepository {
    
    private var dataBase = DataBase()
    
    private static var instanse = DataBaseRepository()
    
    static func newInstanse() -> DataBaseRepository {
        return instanse
    }
    
    func saveCity(model: SearchDataBaseModel) {
        dataBase.saveModel(model: model)
    }
    
    func getSaveCitys() -> Results<SearchDataBaseModel>? {
        return dataBase.getModel()
    }
}
