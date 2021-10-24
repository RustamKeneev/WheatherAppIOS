//
//  WeatherDaysInfoSupportCell.swift
//  WheatherAppIOS
//
//  Created by Rustam Keneev on 21/10/21.
//

import Foundation
import UIKit
import SnapKit
import Kingfisher

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
    
    private lazy var imageDay: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private lazy var imageNitte: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
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
        
        addSubview(imageDay)
        imageDay.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(imageDay.snp.height)
        }
        
        addSubview(imageNitte)
        imageNitte.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(imageDay.snp.right).offset(10)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(imageDay.snp.height)
        }
    }
    
    func fill(day: DailyForecast?, days: Int) {
        if days == 0 {
            dateDay.text = "Сегодня"
        } else {
            dateDay.text = "\(day?.date?.getFormattedDate() ?? "")"
        }
        
        if (day?.day?.icon ?? 0) > 10 {
            imageDay.kf.setImage(with: URL(string: "https://developer.accuweather.com/sites/default/files/\(day?.day?.icon ?? 0)-s.png"))
        } else {
            imageDay.kf.setImage(with: URL(string: "https://developer.accuweather.com/sites/default/files/0\(day?.day?.icon ?? 0)-s.png"))
        }
        
        if (day?.night?.icon ?? 0) > 10 {
            imageNitte.kf.setImage(with: URL(string: "https://developer.accuweather.com/sites/default/files/\(day?.night?.icon ?? 0)-s.png"))
        } else {
            imageNitte.kf.setImage(with: URL(string: "https://developer.accuweather.com/sites/default/files/0\(day?.night?.icon ?? 0)-s.png"))
        }
        
        tempiratureDay.text = "\(((day?.temperature?.maximum?.value ?? 0.0) + (day?.temperature?.minimum?.value ?? 0.0)) / 2.0)°C"
    }
}
