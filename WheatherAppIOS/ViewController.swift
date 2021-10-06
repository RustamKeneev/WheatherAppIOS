//  ViewController.swift
//  WheatherAppIOS
//  Created by Rustam Keneev on 5/10/21.

import UIKit
import SnapKit
import Lottie

class ViewController: UIViewController {
    
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
    
    private lazy var animationView: AnimationView = {
        let view = AnimationView()
        view.animation = Animation.named("weather")
        view.backgroundColor = .clear
        view.backgroundColor = .clear
        view.contentMode = .scaleAspectFit
        view.loopMode = .loop
        view.play()
        return view
    }()
    
    private lazy var roundTheClockUIView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.isOpaque = false
        view.alpha = 0.1
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
       
    private lazy var expectedWeatherLabel: UILabel = {
        let view = UILabel()
        view.text = "Ожидается дождливая погода около 18:00"
        view.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        view.textColor = .white
        return view
    }()
    
    private lazy var separatorLine: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    
    
    
    
    private lazy var tenDaysForecastUIView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.isOpaque = false
        view.alpha = 0.1
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        configure()
//        animation()
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
        view.addSubview(roundTheClockUIView)
        view.addSubview(expectedWeatherLabel)
        view.addSubview(separatorLine)
        view.addSubview(tenDaysForecastUIView)
    }
    
    func setupMakeContraints() {
        animationView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
//            make.width.equalToSuperview()
//            make.height.equalTo(200)
            make.size.equalTo(200)
        }
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
        
        roundTheClockUIView.snp.makeConstraints { (make) in
            make.top.equalTo(temperatureValueUIView.snp.bottom).offset(4)
            make.leading.trailing.equalToSuperview().inset(8)
            make.height.equalTo(200)
        }
        
        tenDaysForecastUIView.snp.makeConstraints { (make) in
            make.top.equalTo(roundTheClockUIView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(8)
            make.height.equalTo(300)
        }
        
        expectedWeatherLabel.snp.makeConstraints { (make) in
            make.top.equalTo(roundTheClockUIView.snp.top).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        separatorLine.snp.makeConstraints { (make) in
            make.top.equalTo(expectedWeatherLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(8)
            make.height.equalTo(1)
        }
    }

    
    func animation()  {
        
    }

}

