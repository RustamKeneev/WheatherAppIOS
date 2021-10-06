//
//  SplashController.swift
//  WheatherAppIOS
//
//  Created by Rustam Keneev on 6/10/21.
//

import Foundation
import UIKit

class SplashController: UIViewController {
    
    private lazy var viewModel: SplashViewModel = {
        return SplashViewModel()
    }()
    
    override func viewDidLoad() {
        viewModel.apiClient.getAutocompleteSearch(search: "bish") { model, message, error in
            dump(model)
        }
    }
    
}
