//
//  SearchResponseModel.swift
//  WheatherAppIOS
//
//  Created by Rustam Keneev on 6/10/21.
//

import Foundation

class SearchResponseModel: Codable {
    
    var key: String? = nil
    var type: String? = nil
    var localizedName: String? = nil
    
    var country: CountryResponseModel? = nil
    var administrativeArea: AdministrativeAreaResponseModel? = nil
    
    enum CodingKeys: String, CodingKey {
        case key = "Key"
        case type = "Type"
        case localizedName = "LocalizedName"
        case country = "Country"
        case administrativeArea = "AdministrativeArea"
    }
    
    func toDataBaseModel() -> SearchDataBaseModel {
        let model = SearchDataBaseModel()
        model.key = key ?? String()
        model.type = type ?? String()
        model.localizedName = localizedName ?? String()
        
        if let country = country {
            let countryDataBaseModel = CountryDataBaseModel()
            countryDataBaseModel.id = country.id ?? String()
            countryDataBaseModel.localizedName = country.localizedName ?? String()
            
            model.country = countryDataBaseModel
        }
        
        if let administrativeArea = administrativeArea {
            let administrativeAreaDataBaseModel = AdministrativeAreaDataBaseModel()
            administrativeAreaDataBaseModel.id = administrativeArea.id ?? String()
            administrativeAreaDataBaseModel.localizedName = administrativeArea.localizedName ?? String()
            
            model.administrativeArea = administrativeAreaDataBaseModel
        }
        
        return model
    }
}
