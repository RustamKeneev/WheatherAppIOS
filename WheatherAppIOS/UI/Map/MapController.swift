//
//  MapController.swift
//  WheatherAppIOS
//
//  Created by Rustam Keneev on 24/10/21.
//

import Foundation
import UIKit
import SnapKit
import CoreLocation
import GoogleMaps

class MapController: BaseViewController{
    
    private lazy var map: GMSMapView = {
        GMSServices.provideAPIKey("AIzaSyCgb1lzHr1qvGKGIYD3Uu9F99mv4BKrlPA")
        
        let camera = GMSCameraPosition.camera(withLatitude: 42.8667, longitude: 74.5667, zoom: 14.0)
        
        let view = GMSMapView.map(withFrame: .zero, camera: camera)
        view.delegate = self
        return view
    }()
    
    private lazy var viewModel: MapViewModel = {
        return MapViewModel(delegate: self)
    }()
    
    private lazy var backButton: UIButton = {
        let view = UIButton()
        view.setTitle("Назад", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        view.addTarget(self, action: #selector(backButton(view:)), for: .touchUpInside)
        return view
    }()
    
    private lazy var saveButton: UIButton = {
        let view = UIButton()
        view.isHidden = true
        view.setTitle("Сохранить", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        view.addTarget(self, action: #selector(seveButton(view:)), for: .touchUpInside)
        return view
    }()
    
    @objc func seveButton(view: UIButton) {
        if let coordinate = coordinate {
            saveButton.isHidden = true
            
            viewModel.getGeoData(lat: coordinate.latitude, lon: coordinate.longitude)
        }
    }
    
    @objc func backButton(view: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    private var coordinate: CLLocationCoordinate2D? = nil

    override func viewDidLoad() {
        view.addSubview(map)
        map.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.top.equalToSuperview()
        }
        
        view.addSubview(backButton)
        backButton.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-16)
            make.right.equalToSuperview().offset(-16)
        }
        
        view.addSubview(saveButton)
        saveButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-16)
        }
        
        let locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.startUpdatingLocation()
    }
}

extension MapController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        
        let camera = GMSCameraPosition.camera(withLatitude: locValue.latitude, longitude: locValue.longitude, zoom: 22.0)
        
        map.camera = camera
    }
}

extension MapController: MapDelegate {
    func showBack() {
        navigationController?.popViewController(animated: true)
    }
}

extension MapController: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        
        self.coordinate = coordinate
        
        map.clear()
        saveButton.isHidden = false

        var marker = GMSMarker(position: coordinate)
        marker.title = "Выбраное место"
        marker.map = map
    }
}
