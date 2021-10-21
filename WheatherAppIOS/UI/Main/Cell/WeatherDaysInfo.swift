//
//  WeatherDaysInfo.swift
//  WheatherAppIOS
//
//  Created by Rustam Keneev on 21/10/21.
//

import Foundation
import UIKit
import SnapKit

class WeatherDaysInfo: UICollectionViewCell {
    
    private lazy var viewContatints: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    private lazy var titleDay: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.text = "Прогноз погоды на 5 дней"
        view.numberOfLines = 0
        view.font = UIFont.systemFont(ofSize: 14)
        return view
    }()
    
    private lazy var viewSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    private lazy var daysInfoCollectionView: UITableView = {
        let view = UITableView()
        view.backgroundColor = .clear
        view.isScrollEnabled = false
        view.delegate = self
        view.dataSource = self
        
        view.register(WeatherDaysInfoSupportCell.self, forCellReuseIdentifier: "WeatherDaysInfoSupportCell")
        return view
    }()
    
    override func layoutSubviews() {
        addSubview(viewContatints)
        viewContatints.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-4)
            make.top.equalToSuperview().offset(4)
        }
        
        viewContatints.addSubview(titleDay)
        titleDay.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(14)
            make.right.equalToSuperview().offset(-14)
            make.top.equalToSuperview().offset(8)
        }
        
        viewContatints.addSubview(viewSeparator)
        viewSeparator.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(14)
            make.right.equalToSuperview()
            make.top.equalTo(titleDay.snp.bottom).offset(8)
            make.height.equalTo(1)
        }
                
        viewContatints.addSubview(daysInfoCollectionView)
        daysInfoCollectionView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(viewSeparator.snp.bottom)
        }
        
        daysInfoCollectionView.reloadData()
    }
}

extension WeatherDaysInfo: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherDaysInfoSupportCell", for: indexPath) as! WeatherDaysInfoSupportCell
        return cell
    }
}
