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
        view.register(WeatherDaysInfo.self, forCellWithReuseIdentifier: "WeatherDaysInfo")
        view.register(WeatherSupportCell.self, forCellWithReuseIdentifier: "WeatherSupportCell")
        view.register(WeatherMapCell.self, forCellWithReuseIdentifier: "WeatherMapCell")
        return view
    }()
    
    private lazy var viewSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    private lazy var cityTitle: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        view.textAlignment = .center
        view.textColor = .white
        return view
    }()
    
    private lazy var backButton: UIButton = {
        let view = UIButton()
        view.setTitle("Back", for: .normal)
        view.titleLabel?.textColor = .white
        view.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        view.addTarget(self, action: #selector(clickBack(view:)), for: .touchUpInside)
        return view
    }()
    
    @objc func clickBack(view: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .black
        
        cityTitle.text = cityName
        
        view.addSubview(cityTitle)
        cityTitle.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(16)
        }
        
        view.addSubview(viewSeparator)
        viewSeparator.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-40)
            make.height.equalTo(1)
        }
        
        view.addSubview(backButton)
        backButton.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-16)
            make.top.equalTo(viewSeparator.snp.bottom)
            make.bottom.equalToSuperview()
        }
        
        view.addSubview(infoCollectionView)
        infoCollectionView.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-16)
            make.left.equalToSuperview().offset(16)
            make.top.equalTo(cityTitle.snp.bottom)
            make.bottom.equalTo(viewSeparator.snp.top)
        }
        
        viewModel.getWeather(cityKey: cityKey ?? 0)
    }
}

extension MainController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: self.view.frame.width - 32, height: 116) // WeatherTitleCell
        } else if indexPath.row == 1 {
            return CGSize(width: self.view.frame.width - 32, height: 220) // WeatherDayCell
        } else if indexPath.row == 2 {
            return CGSize(width: self.view.frame.width - 32, height: 290) // WeatherDaysInfo
        } else if (3...8).contains(indexPath.row) {
            return CGSize(width: (self.view.frame.width / 2) - 30, height: (self.view.frame.width / 2) - 30) // WeatherSupportCell
        } else {
            return CGSize(width: self.view.frame.width - 32, height: 200) // WeatherMapCell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherTitleCell", for: indexPath) as! WeatherTitleCell
            cell.fill(model: viewModel.wearherModel)
            return cell
        } else if indexPath.row == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherDayCell", for: indexPath) as! WeatherDayCell
            cell.fill(model: viewModel.wearherModel)
            return cell
        } else if indexPath.row == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherDaysInfo", for: indexPath) as! WeatherDaysInfo
            cell.fill(model: viewModel.wearherModel)
            return cell
        } else if (3...8).contains(indexPath.row) {
            return collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherSupportCell", for: indexPath) as! WeatherSupportCell
        } else {
            return collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherMapCell", for: indexPath) as! WeatherMapCell
        }
    }
}

extension MainController: MainDelegate {
    func showWeather() {
        self.infoCollectionView.reloadData()
    }
}
