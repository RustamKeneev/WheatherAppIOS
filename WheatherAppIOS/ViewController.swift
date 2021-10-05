//
//  ViewController.swift
//  WheatherAppIOS
//
//  Created by Rustam Keneev on 5/10/21.
//

import UIKit
import SnapKit
import Lottie

class ViewController: UIViewController {
    
    let animationView = AnimationView()

    private lazy var cityLabel: UILabel = {
        let view = UILabel()
        view.text = "Бишкек"
        view.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        view.textAlignment = .center
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
    }
    
    func setupMakeContraints() {
        cityLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(40)
            make.leading.trailing.equalToSuperview()
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

