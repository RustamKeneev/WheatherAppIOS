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
    
    private lazy var gifAnimations: UIImageView = {
        let view = UIImageView()
        view.loadGif(name: "rain")
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var titleCity: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        view.textColor = .white
        return view
    }()
    
    private lazy var dateTitle: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 12,weight: .regular)
        view.textColor = .white
        return view
    }()
    
    private lazy var weatherTermins: UILabel = {
        let view = UILabel()
        view.text = "Облачно с прояснениями"
        view.font = UIFont.systemFont(ofSize: 12,weight: .semibold)
        view.textColor = .white
        return view
    }()
    
    private lazy var cuurentTemperatureLabel: UILabel = {
        let view = UILabel()
        view.text = "10º"
        view.textColor = .white
        view.font = UIFont.systemFont(ofSize: 48, weight: .semibold)
        return view
    }()
    
    private lazy var minTemperatureValue: UILabel = {
        let view = UILabel()
        view.text = "4º"
        view.textColor = .white
        view.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        return view
    }()
    
    
    private lazy var minTemperatureLabel: UILabel = {
        let view = UILabel()
        view.text = "мин.:"
        view.textColor = .white
        view.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        return view
    }()
    
    private lazy var maxTemperatureValue: UILabel = {
        let view = UILabel()
        view.text = "16º,"
        view.textColor = .white
        view.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        return view
    }()
    
    private lazy var maxTemperatureLabel: UILabel = {
        let view = UILabel()
        view.text = "Макс.:"
        view.textColor = .white
        view.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        return view
    }()
    
    
    
    override func layoutSubviews() {
        layer.cornerRadius = 16
        
        addSubview(gifAnimations)
        gifAnimations.snp.makeConstraints { (make) in
            make.top.bottom.right.left.equalToSuperview()
            make.height.width.equalToSuperview()
        }
        
        addSubview(titleCity)
        titleCity.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(8)
            make.left.equalToSuperview().offset(8)
        }
        
        addSubview(dateTitle)
        dateTitle.snp.makeConstraints { (make) in
            make.top.equalTo(titleCity.snp.bottom).offset(4)
            make.left.equalTo(titleCity.snp.left)
        }
        
        addSubview(weatherTermins)
        weatherTermins.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-8)
            make.left.equalTo(dateTitle.snp.left)
        }
        
        addSubview(cuurentTemperatureLabel)
        cuurentTemperatureLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleCity.snp.top)
            make.right.equalToSuperview().offset(-8)
        }
        
        addSubview(minTemperatureValue)
        minTemperatureValue.snp.makeConstraints { (make) in
            make.bottom.equalTo(weatherTermins.snp.bottom)
            make.right.equalTo(cuurentTemperatureLabel.snp.right).offset(-8)
        }
        
        addSubview(minTemperatureLabel)
        minTemperatureLabel.snp.makeConstraints { (make) in
            make.top.equalTo(minTemperatureValue.snp.top)
            make.right.equalTo(minTemperatureValue.snp.left).offset(-4)
        }
        
        addSubview(maxTemperatureValue)
        maxTemperatureValue.snp.makeConstraints { (make) in
            make.top.equalTo(minTemperatureValue.snp.top)
            make.right.equalTo(minTemperatureLabel.snp.left).offset(-8)
        }
        
        addSubview(maxTemperatureLabel)
        maxTemperatureLabel.snp.makeConstraints { (make) in
            make.top.equalTo(maxTemperatureValue.snp.top)
            make.right.equalTo(maxTemperatureValue.snp.left).offset(-4)
        }
    }
    
    func fill(model: SearchDataBaseModel?) {
        titleCity.text = model?.localizedName ?? String()
        
        let date = Date()
        let formate = date.getFormattedDate(format: "HH:mm")
        dateTitle.text = formate
        
    }
}

extension Date {
   func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}


