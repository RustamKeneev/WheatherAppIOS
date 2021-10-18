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
    
    private lazy var viewModel: MainViewModel = {
        return MainViewModel(delegate: self)
    }()
    
    static func newInstanse(cityKey: Int, cityName: String) -> MainController {
        let viewController = MainController()
        viewController.cityKey = cityKey
        viewController.cityName = cityName
        return viewController
    }
    
    private var cityKey: Int? = nil
    private var cityName: String? = nil

    private lazy var infoCollectionView : UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        view.delegate = self
        view.dataSource = self
        view.register(WeatherTitleCell.self, forCellWithReuseIdentifier: "WeatherTitleCell")
        view.register(WeatherDayCell.self, forCellWithReuseIdentifier: "WeatherDayCell")
        return view
    }()
    
    private lazy var cityTitle: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        view.textAlignment = .center
        view.textColor = .white
        return view
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .black
        
        cityTitle.text = cityName
        
        view.addSubview(cityTitle)
        cityTitle.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(16)
        }
        
        view.addSubview(infoCollectionView)
        infoCollectionView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(cityTitle.snp.bottom)
            make.bottom.equalToSuperview()
        }
    }
}

extension MainController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: self.view.frame.width, height: 116) // WeatherTitleCell
        } else {
            return CGSize(width: self.view.frame.width, height: 160) // WeatherDayCell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            return collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherTitleCell", for: indexPath) as! WeatherTitleCell
        } else {
            return collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherDayCell", for: indexPath) as! WeatherDayCell
        }
    }
}

extension MainController: MainDelegate {
    func showWeather() {
        
    }
}
