//
//  SearchCityCell.swift
//  WheatherAppIOS
//
//  Created by Rustam Keneev on 9/10/21.
//

import Foundation
import UIKit
import SnapKit

class SearchCityCell: UICollectionViewCell {
    
    private lazy var titleCity: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        view.textColor = .white
        return view
    }()
    
    override func layoutSubviews() {
        layer.cornerRadius = 16
        
        addSubview(titleCity)
        titleCity.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }
    
    func fill(model: SearchDataBaseModel?) {
        titleCity.text = model?.localizedName ?? String()
    }
}
