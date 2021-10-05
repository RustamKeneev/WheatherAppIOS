//  ViewController.swift
//  WheatherAppIOS
//  Created by Rustam Keneev on 5/10/21.

import UIKit
import SnapKit
import Lottie

class ViewController: UIViewController {
    
    let animationView = AnimationView()

    private lazy var cityLabel: UILabel = {
        let view = UILabel()
        view.text = "Бишкек"
        view.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        view.textAlignment = .center
        view.textColor = .lightGray
        return view
    }()
    
    private lazy var temperatureLabel: UILabel = {
        let view = UILabel()
        view.text = "6"
        view.textColor = .lightGray
        view.textAlignment = .center
        view.font = UIFont.systemFont(ofSize: 48, weight: .regular)
        return view
    }()
    
    private lazy var weatherValueLabel: UILabel = {
        let view = UILabel()
        view.text = "Дождь"
        view.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        view.textAlignment = .center
        view.textColor = .lightGray
        return view
    }()
    
    private lazy var temperatureValueUIView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.addSubview(maxTemperatureLabel)
        view.addSubview(maxTemperatureValue)
        view.addSubview(minTemperatureLabel)
        view.addSubview(minTemperatureValue)
        
        maxTemperatureLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(8)
            make.top.equalToSuperview()
        }
        
        maxTemperatureValue.snp.makeConstraints { (make) in
            make.left.equalTo(maxTemperatureLabel.snp.right)
            make.top.equalTo(maxTemperatureLabel.snp.top)
            make.bottom.equalTo(maxTemperatureLabel.snp.bottom)
        }
        
        minTemperatureLabel.snp.makeConstraints { (make) in
            make.left.equalTo(maxTemperatureValue.snp.right)
            make.top.equalTo(maxTemperatureValue.snp.top)
            make.bottom.equalTo(maxTemperatureValue.snp.bottom)
        }
        
        minTemperatureValue.snp.makeConstraints { (make) in
            make.left.equalTo(minTemperatureLabel.snp.right)
            make.top.equalTo(minTemperatureLabel.snp.top)
            make.bottom.equalTo(minTemperatureLabel.snp.bottom)
        }
        return view
    }()
    
    private lazy var maxTemperatureLabel: UILabel = {
        let view = UILabel()
        view.text = "Макс.: "
        view.font = UIFont.systemFont(ofSize: 14,weight: .regular)
        view.textColor = .lightGray
        return view
    }()
    
    private lazy var maxTemperatureValue: UILabel = {
        let view = UILabel()
        view.text = "13',"
        view.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        view.textColor = .lightGray
        return view
    }()
    
    private lazy var minTemperatureLabel: UILabel = {
        let view = UILabel()
        view.text = " мин.:"
        view.font = UIFont.systemFont(ofSize: 14,weight: .regular)
        view.textColor = .lightGray
        return view
    }()
    
    private lazy var minTemperatureValue: UILabel = {
        let view = UILabel()
        view.text = "-4'"
        view.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        view.textColor = .lightGray
        return view
    }()
    
    
//    private lazy var animationView: AnimationView = {
//        let view = AnimationView()
//        view.backgroundColor = .clear
//        return view
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        configure()
        animation()
    }
    
    func configure(){
        setupAddSubviews()
        setupMakeContraints()
    }
    
    func setupAddSubviews() {
        view.addSubview(animationView)
        view.addSubview(cityLabel)
        view.addSubview(temperatureLabel)
        view.addSubview(weatherValueLabel)
        view.addSubview(temperatureValueUIView)
    }
    
    func setupMakeContraints() {
        cityLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(30)
            make.leading.trailing.equalToSuperview()
        }
        
        temperatureLabel.snp.makeConstraints { (make) in
            make.top.equalTo(cityLabel.snp.bottom)
            make.left.equalTo(cityLabel.snp.left)
            make.right.equalTo(cityLabel.snp.right)
        }
        
        weatherValueLabel.snp.makeConstraints { (make) in
            make.top.equalTo(temperatureLabel.snp.bottom)
            make.left.equalTo(temperatureLabel.snp.left)
            make.right.equalTo(temperatureLabel.snp.right)
        }
        
        temperatureValueUIView.snp.makeConstraints { (make) in
            make.top.equalTo(weatherValueLabel.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(110)
            make.height.equalTo(30)
        }
    }

    
    func animation()  {
        animationView.animation = Animation.named("weather")
        animationView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        animationView.center = view.center
        animationView.backgroundColor = .clear
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
//        view.addSubview(animationView)
    }

}

