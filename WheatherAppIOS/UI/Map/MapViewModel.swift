//
//  MapViewModel.swift
//  WheatherAppIOS
//
//  Created by Rustam Keneev on 24/10/21.
//

import Foundation

protocol MapDelegate: AnyObject {
    func showBack()
}

class MapViewModel: BaseViewModel {
    
    private weak var delegate: MapDelegate? = nil
    
    init(delegate: MapDelegate) {
        self.delegate = delegate
    }
    
    func getGeoData(lat: Double, lon: Double) {
        apiClient.getGeoSearch(lat: lat, lon: lon) { model, message, error in
            
            if let model = model {
                DispatchQueue.main.async {
                    self.dataBase.saveCity(model: model.toDataBaseModel())
                    
                    self.delegate?.showBack()
                }
            }
        }
    }
}
