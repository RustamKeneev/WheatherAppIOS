//
//  MainViewModel.swift
//  WheatherAppIOS
//
//  Created by Rustam Keneev on 18/10/21.
//

import Foundation

protocol MainDelegate: AnyObject {
    func showWeather()
}

class MainViewModel: BaseViewModel {
    
    var wearherModel: DaysOfDailyForecastsResponseModel? = nil
    
    private weak var delegate: MainDelegate? = nil
    
    init(delegate: MainDelegate) {
        self.delegate = delegate
    }
    
    func getWeather(cityKey: Int) {
        apiClient.getDaysOfDailyForecasts(cityKey: cityKey) { [self] model, message, error in
            if let model = model {
                wearherModel = model
            }
        }
    }
    
    enum TypeCell {
        case Title
    }
}

