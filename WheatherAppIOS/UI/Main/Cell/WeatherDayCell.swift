//
//  WeatherDayCell.swift
//  WheatherAppIOS
//
//  Created by Rustam Keneev on 18/10/21.
//

import Foundation
import UIKit
import SnapKit

class WeatherDayCell: UICollectionViewCell {
    
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
        view.text = "Ожидаеться переменая обочность около 18:00"
        view.numberOfLines = 0
        view.font = UIFont.systemFont(ofSize: 14)
        return view
    }()
    
    private lazy var viewSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    private lazy var dayInfoCollectionView : UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        view.delegate = self
        view.dataSource = self
        view.register(WeatherInfoDayCell.self, forCellWithReuseIdentifier: "WeatherInfoDayCell")
        return view
    }()
    
    override func layoutSubviews() {
        addSubview(viewContatints)
        viewContatints.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(16)
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
                
        viewContatints.addSubview(dayInfoCollectionView)
        dayInfoCollectionView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(viewSeparator.snp.bottom)
        }
        
        dayInfoCollectionView.reloadData()
    }
}

extension WeatherDayCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherInfoDayCell", for: indexPath) as! WeatherInfoDayCell
    }
}
