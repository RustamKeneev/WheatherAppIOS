//
//  WeatherTitleCell.swift
//  WheatherAppIOS
//
//  Created by Rustam Keneev on 18/10/21.
//

import Foundation
import UIKit
import SnapKit

class WeatherTitleCell: UICollectionViewCell {
    
    private lazy var cityTitle: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.text = "12°"
        view.font = UIFont.systemFont(ofSize: 40)
        return view
    }()
    
    private lazy var weatherInfo: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = UIFont.systemFont(ofSize: 16)
        view.numberOfLines = 0
        view.textAlignment = .center
        view.text = "Премужественно ясно\nмакс.:18°, мин.:3°,"
        return view
    }()
    
    override func layoutSubviews() {
        addSubview(cityTitle)
        cityTitle.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(10)
        }
        
        addSubview(weatherInfo)
        weatherInfo.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(cityTitle.snp.bottom).offset(8)
        }
    }
}
