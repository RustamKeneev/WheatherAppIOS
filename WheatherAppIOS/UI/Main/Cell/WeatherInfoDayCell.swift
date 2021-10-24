//
//  WeatherInfoDayCell.swift
//  WheatherAppIOS
//
//  Created by Rustam Keneev on 18/10/21.
//

import Foundation
import UIKit
import SnapKit

class WeatherInfoDayCell: UICollectionViewCell {
    
    private lazy var dateDay: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.text = "14"
        view.numberOfLines = 0
        view.textAlignment = .center
        view.font = UIFont.systemFont(ofSize: 12, weight: .bold)
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
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalToSuperview().offset(8)
        }
        
        addSubview(tempiratureDay)
        tempiratureDay.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-8)
        }
    }
    
    func fill(day: DailyForecast?, days: Int) {
        if days == 0 {
            dateDay.text = "Сегодня\nДнем \(day?.day?.iconPhrase ?? "")\nНочью \(day?.night?.iconPhrase ?? "")"
        } else {
            dateDay.text = "\(day?.date?.getFormattedDate() ?? "")\nДнем \(day?.day?.iconPhrase ?? "")\nНочью \(day?.night?.iconPhrase ?? "")"
        }
        
        tempiratureDay.text = "\(((day?.temperature?.maximum?.value ?? 0.0) + (day?.temperature?.minimum?.value ?? 0.0)) / 2.0)°C"
    }
}
