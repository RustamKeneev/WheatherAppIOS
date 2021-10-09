//
//  SearchViewModel.swift
//  WheatherAppIOS
//
//  Created by Rustam Keneev on 9/10/21.
//

import Foundation
import RealmSwift

protocol SearchDelegate: AnyObject {
    func showSearch(models: [SearchResponseModel])
    func showSaveSearch()
    func showNotFound()
}

class SearchViewModel: BaseViewModel {
    
    private weak var delegate: SearchDelegate? = nil
    
    var saveCity: Results<SearchDataBaseModel>? = nil
    
    init(delegate: SearchDelegate) {
        self.delegate = delegate
    }
    
    func saveCityModel(model: SearchDataBaseModel) {
        dataBase.saveCity(model: model)
    }
    
    func showSaveCityModel() {
        saveCity = dataBase.getSaveCitys()
        
        delegate?.showSaveSearch()
    }
    
    func getSearchCity(text: String) {
        apiClient.getAutocompleteSearch(search: text) { [self] model, message, error in
            if let model = model {
                if model.count > 0 {
                    delegate?.showSearch(models: model)
                } else {
                    delegate?.showNotFound()
                }
            } else {
                delegate?.showNotFound()
            }
        }
    }
    
}
