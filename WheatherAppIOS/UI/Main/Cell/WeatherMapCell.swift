//
//  WeatherMapCell.swift
//  WheatherAppIOS
//
//  Created by Rustam Keneev on 21/10/21.
//

import Foundation
import UIKit
import SnapKit
import GoogleMaps

class WeatherMapCell: UICollectionViewCell {
    
    private lazy var map: GMSMapView = {
        GMSServices.provideAPIKey("AIzaSyCgb1lzHr1qvGKGIYD3Uu9F99mv4BKrlPA")
        
        let camera = GMSCameraPosition.camera(withLatitude: 42.8667, longitude: 74.5667, zoom: 14.0)
        
        let view = GMSMapView.map(withFrame: .zero, camera: camera)
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var viewContatints: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    override func layoutSubviews() {
        addSubview(viewContatints)
        viewContatints.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-4)
            make.top.equalToSuperview().offset(4)
        }
        
        viewContatints.addSubview(map)
        map.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(1)
            make.right.equalToSuperview().offset(-1)
            make.bottom.equalToSuperview().offset(-1)
            make.top.equalToSuperview().offset(1)
        }
    }
}
