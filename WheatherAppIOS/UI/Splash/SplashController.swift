//
//  SplashController.swift
//  WheatherAppIOS
//
//  Created by Rustam Keneev on 6/10/21.
//

import Foundation
import UIKit

class SplashController: BaseViewController {
    
    private lazy var viewModel: SplashViewModel = {
        return SplashViewModel(delegate: self)
    }()
    
    override func viewDidLoad() {
        viewModel.checkSaveCity()
    }
}

extension SplashController: SplashDelegate {
    func showSearch() {
        navigationController?.pushViewController(SearchController(), animated: true)
    }
    
    func showMain() {
        navigationController?.pushViewController(MainController(), animated: true)
    }
}
