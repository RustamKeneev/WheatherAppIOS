//
//  ApiRepository.swift
//  WheatherAppIOS
//
//  Created by Rustam Keneev on 6/10/21.
//

import Foundation

class ApiRepository {
    
    private let api = ApiClient()
    
    private static var instanse = ApiRepository()
    
    static func newInstanse() -> ApiRepository {
        return instanse
    }
    
    func getAutocompleteSearch(search: String, completion: @escaping ([SearchResponseModel]?, String?, Error?) -> Void) {
        api.getAutocompleteSearch(search: search, completion: completion)
    }
    
    func getDaysOfDailyForecasts(cityKey: Int, completion: @escaping (DaysOfDailyForecastsResponseModel?, String?, Error?) -> Void) {
        api.getDaysofDailyForecasts(cityKey: cityKey, completion: completion)
    }
}
