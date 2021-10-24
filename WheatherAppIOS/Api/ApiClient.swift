//
//  ApiClient.swift
//  WheatherAppIOS
//
//  Created by Rustam Keneev on 6/10/21.
//

import Foundation

class ApiClient {
    
    private let AUTOCOMPLETE_SEARCH = "http://dataservice.accuweather.com/locations/v1/cities/autocomplete"
    private let DAYS_OF_DAILY_FORESTS = "http://dataservice.accuweather.com/forecasts/v1/daily/5day/"
    private let GET_GEO_POINT_CITY_KEY = "http://dataservice.accuweather.com/locations/v1/cities/geoposition/search"

    func getGeoSearch(lat: Double, lon: Double, completion: @escaping (SearchResponseModel?, String?, Error?) -> Void) {
        let params = [
            "apikey" : Constants.API_KEY,
            "q" : "\(lat), \(lon)",
            "language" : Constants.LANGUAGE_EN,
            "details" : "false",
            "toplevel" : "false"
        ]
        
        sendGetRequest(url: GET_GEO_POINT_CITY_KEY, parameters: params, completion: completion)
    }
    
    func getAutocompleteSearch(search: String, completion: @escaping ([SearchResponseModel]?, String?, Error?) -> Void) {
        let params = [
            "apikey" : Constants.API_KEY,
            "q" : search,
            "language" : Constants.LANGUAGE_EN
        ]
        
        sendGetRequest(url: AUTOCOMPLETE_SEARCH, parameters: params, completion: completion)
    }
    
    func getDaysofDailyForecasts(cityKey: Int, completion: @escaping (DaysOfDailyForecastsResponseModel?, String?, Error?) -> Void) {
        let params = [
            "apikey" : Constants.API_KEY,
            "language" : Constants.LANGUAGE_RU,
            "details" : "false",
            "metric" : "true"

        ]
        
        sendGetRequest(url: DAYS_OF_DAILY_FORESTS + String(cityKey), parameters: params, completion: completion)
    }
    
    func sendGetRequest<T: Codable>(url: String, parameters: [String: String], completion: @escaping (T?, String?, Error?) -> Void) {
        var components = URLComponents(string: url)!
        components.queryItems = parameters.map { (key, value) in
            URLQueryItem(name: key, value: value)
        }
        components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
        let request = URLRequest(url: components.url!)
                
        URLSession.shared.dataTask(with: request) { data, response, error in
            print(data)
            
            DispatchQueue.main.async {
                do {
                    if let data = data {
                        if let jsonString = String(data: data, encoding: .utf8) {
                            print(jsonString)
                        }
                        
                        let model = try JSONDecoder().decode(T.self, from: data)
                    
                        completion(model, nil, nil)
                    } else {
                        completion(nil, "Error data is nil", error)
                    }
                } catch {
                    completion(nil, "Error convert model", error)
                }
            }
        }.resume()
    }
}
