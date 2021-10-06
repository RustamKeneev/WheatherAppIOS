//
//  ApiClient.swift
//  WheatherAppIOS
//
//  Created by Rustam Keneev on 6/10/21.
//

import Foundation

class ApiClient {
    
    private let AUTOCOMPLETE_SEARCH = "http://dataservice.accuweather.com/locations/v1/cities/autocomplete"
    
    func getAutocompleteSearch(search: String, completion: @escaping ([SearchResponseModel]?, String?, Error?) -> Void) {
        let params = [
            "apikey" : Constants.API_KEY,
            "q" : search,
            "language" : Constants.LANGUAGE_EN
        ]
        
        sendGetRequest(url: AUTOCOMPLETE_SEARCH, parameters: params, completion: completion)
    }
    
    func sendGetRequest<T: Codable>(url: String, parameters: [String: String], completion: @escaping (T?, String?, Error?) -> Void) {
        var components = URLComponents(string: url)!
        components.queryItems = parameters.map { (key, value) in
            URLQueryItem(name: key, value: value)
        }
        components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
        let request = URLRequest(url: components.url!)
                
        URLSession.shared.dataTask(with: request) { data, response, error in
            do {
                if let data = data {
                    let model = try JSONDecoder().decode(T.self, from: data)
                
                    completion(model, nil, nil)
                } else {
                    completion(nil, "Error data is nil", error)
                }
            } catch {
                completion(nil, "Error convert model", error)
            }
        }.resume()
    }
}
