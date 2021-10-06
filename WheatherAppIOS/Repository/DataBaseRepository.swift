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
    
    func saveSearchModel(model: SearchDataBaseModel) {
        dataBase.saveModel(model: model)
    }
    
    func getSearchModel() -> Results<SearchDataBaseModel>? {
        return dataBase.getModel()
    }
}
