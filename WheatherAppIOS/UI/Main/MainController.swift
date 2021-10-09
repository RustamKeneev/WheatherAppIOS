//
//  MainController.swift
//  WheatherAppIOS
//
//  Created by Rustam Keneev on 9/10/21.
//

import Foundation
import UIKit
import SnapKit

class MainController: BaseViewController {
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        
        var label = UILabel()
        label.text = "test1"
        
        view.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }
}

