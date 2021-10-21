//
//  WeatherDaysInfoSupportCell.swift
//  WheatherAppIOS
//
//  Created by Rustam Keneev on 21/10/21.
//

import Foundation
import UIKit
import SnapKit

class WeatherDaysInfoSupportCell: UITableViewCell {
    
    private lazy var dateDay: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.text = "Суббота"
        view.numberOfLines = 0
        view.textAlignment = .center
        view.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return view
    }()
    
    private lazy var tempiratureDay: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.text = "10°"
        view.numberOfLines = 0
        view.textAlignment = .center
        view.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return view
    }()
    
    override func layoutSubviews() {
        addSubview(dateDay)
        dateDay.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
        }
        
        addSubview(tempiratureDay)
        tempiratureDay.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
        }
    }
}
