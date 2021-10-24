//
//  WeatherSupportCell.swift
//  WheatherAppIOS
//
//  Created by Rustam Keneev on 21/10/21.
//

import Foundation
import UIKit
import SnapKit

class WeatherSupportCell: UICollectionViewCell {
    
    private lazy var viewContatints: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    private lazy var supportTitleInfo: UILabel = {
        let view = UILabel()
        view.textColor = .gray
        view.text = "Температура"
        view.font = UIFont.systemFont(ofSize: 12)
        return view
    }()
    
    private lazy var titleInfo: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.text = "В нис/шир"
        view.numberOfLines = 0
        view.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return view
    }()
    
    private lazy var descriptionInfo: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.text = "10/2 -*2"
        view.numberOfLines = 0
        view.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return view
    }()
    
    override func layoutSubviews() {
        addSubview(viewContatints)
        viewContatints.snp.makeConstraints { (make) in
            make.right.left.equalToSuperview()
            make.bottom.equalToSuperview()
            make.top.equalToSuperview()
        }
        
        viewContatints.addSubview(supportTitleInfo)
        supportTitleInfo.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(14)
            make.right.equalToSuperview().offset(-14)
            make.top.equalToSuperview().offset(4)
        }
        
        viewContatints.addSubview(titleInfo)
        titleInfo.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(14)
            make.right.equalToSuperview().offset(-14)
            make.top.equalToSuperview().offset(20)
        }
        
        viewContatints.addSubview(descriptionInfo)
        descriptionInfo.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(14)
            make.right.equalToSuperview()
            make.top.equalToSuperview().offset(55)
        }
    }
}
