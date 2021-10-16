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
    static func newInstanse(cityKey: Int) -> MainController {
        let viewController = MainController()
        viewController.cityKey = cityKey
        return viewController
    }
    
    private var cityKey: Int? = nil
    
    private lazy var infoCollectionView : UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        view.delegate = self
        view.dataSource = self
        return view
    }()
    
    private lazy var cityTitle: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        view.textColor = .white
        return view
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .black
        
        cityTitle.text = String(cityKey ?? 0)
        
        ApiRepository.newInstanse().getDaysOfDailyForecasts(cityKey: 222844) { model, message, error in
            dump(model)
            print(message)
        }
        
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
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}

