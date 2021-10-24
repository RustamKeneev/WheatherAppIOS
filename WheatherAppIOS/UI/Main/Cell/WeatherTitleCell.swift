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
        view.textAlignment = .center
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
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalToSuperview().offset(10)
        }
        
        addSubview(weatherInfo)
        weatherInfo.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalTo(cityTitle.snp.bottom).offset(8)
        }
    }
    
    public func fill(model: DaysOfDailyForecastsResponseModel?) {
        cityTitle.text = "\(((model?.dailyForecasts?[0].temperature?.maximum?.value ?? 0.0) + (model?.dailyForecasts?[0].temperature?.minimum?.value ?? 0.0)) / 2.0)°C"
        weatherInfo.text = "\(model?.headline?.text ?? "")\nмакс.:\(model?.dailyForecasts?[0].temperature?.maximum?.value ?? 0.0)°, мин.:\(model?.dailyForecasts?[0].temperature?.minimum?.value ?? 0.0)°,"
    }
}
