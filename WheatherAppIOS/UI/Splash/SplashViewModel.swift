//
//  SplashViewModel.swift
//  WheatherAppIOS
//
//  Created by Rustam Keneev on 6/10/21.
//

import Foundation

protocol SplashDelegate: AnyObject {
    func showSearch()
    func showMain()
}

class SplashViewModel: BaseViewModel {
    
    private weak var delegate: SplashDelegate? = nil
    
    init(delegate: SplashDelegate) {
        self.delegate = delegate
    }
    
    func checkSaveCity() {
        let citys = dataBase.getSaveCitys()
        
        delegate?.showSearch()
//        if citys != nil && (citys?.count ?? 0) > 0 {
//            delegate?.showMain()
//        } else {
//            delegate?.showSearch()
//        }
    }
}
