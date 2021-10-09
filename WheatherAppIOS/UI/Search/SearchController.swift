//
//  SearchController.swift
//  WheatherAppIOS
//
//  Created by Rustam Keneev on 9/10/21.
//

import Foundation
import UIKit
import SnapKit

class SearchController: BaseViewController {
    
    private lazy var viewModel: SearchViewModel = {
        return SearchViewModel(delegate: self)
    }()
    
    private lazy var titleLable: UILabel = {
        let view = UILabel()
        view.text = "Погода"
        view.textColor = .white
        view.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        return view
    }()
    
    private lazy var searchTextField: UITextField = {
        let view = UITextField()
        view.delegate = self
        view.font = UIFont.systemFont(ofSize: 16)
        view.textColor = .white
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 32))
        view.leftView = paddingView
        view.leftViewMode = .always
        view.attributedPlaceholder = NSAttributedString(string: "Поиск города",
                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 8
        return view
    }()
    
    private lazy var canselButton: UIButton = {
        let view = UIButton()
        view.isHidden = true
        view.setTitle("Отменить", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        view.addTarget(self, action: #selector(canselButtonClick), for: .touchUpInside)
        return view
    }()
    
    private lazy var searchTableView: UITableView = {
        let view = UITableView()
        view.isHidden = true
        view.backgroundColor = .black
        view.separatorStyle = .none
        view.delegate = self
        view.dataSource = self
        return view
    }()
    
    private lazy var saveCityCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        view.backgroundColor = .black
        view.dataSource = self
        view.delegate = self
        view.register(SearchCityCell.self, forCellWithReuseIdentifier: "SearchCityCell")
        return view
    }()
    
    private var models: [SearchResponseModel] = []
    
    @objc func canselButtonClick(view: UIButton) {
        closeSearch()
    }
    
    func closeSearch() {
        canselButton.isHidden = true
        searchTableView.isHidden = true
        saveCityCollectionView.isHidden = false

        searchTextField.snp.remakeConstraints { (make) in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(32)
            make.top.equalTo(titleLable.snp.bottom).offset(8)
        }
        
        searchTextField.text = String()
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .black
        
        view.addSubview(titleLable)
        titleLable.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(24)
            make.left.equalToSuperview().offset(16)
        }
        
        view.addSubview(searchTextField)
        searchTextField.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(32)
            make.top.equalTo(titleLable.snp.bottom).offset(8)
        }
        
        view.addSubview(canselButton)
        canselButton.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-0)
            make.height.equalTo(32)
            make.top.equalTo(titleLable.snp.bottom).offset(8)
        }
        
        view.addSubview(searchTableView)
        searchTableView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(searchTextField.snp.bottom)
        }
        
        view.addSubview(saveCityCollectionView)
        saveCityCollectionView.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.top.equalTo(searchTextField.snp.bottom).offset(16)
        }
        
        viewModel.showSaveCityModel()
    }
}

extension SearchController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.saveCity?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCityCell", for:  indexPath) as! SearchCityCell
        cell.backgroundColor = .gray
        cell.fill(model: viewModel.saveCity?[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 32, height: 110)
    }
}

extension SearchController: SearchDelegate {
    func showSaveSearch() {
        saveCityCollectionView.reloadData()
    }
    
    func showSearch(models: [SearchResponseModel]) {
        self.models = models
        
        searchTableView.reloadData()
    }
    
    func showNotFound() {
        models = []
        
        searchTableView.reloadData()
    }
}

extension SearchController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.saveCityModel(model: models[indexPath.row].toDataBaseModel())
        
        tableView.reloadData()
        
        closeSearch()
        viewModel.showSaveCityModel()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let model = models[indexPath.row]
        
        cell.textLabel?.text = model.localizedName
        cell.textLabel?.textColor = .white
        cell.backgroundColor = .black
        
        return cell
    }
}

extension SearchController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        let text = textField.text
        
        if let text = text {
            viewModel.getSearchCity(text: text)
        }
        
        if (text?.count ?? 0) > 0 {
            canselButton.isHidden = false
            searchTableView.isHidden = false
            saveCityCollectionView.isHidden = true
            
            searchTextField.snp.remakeConstraints { (make) in
                make.left.equalToSuperview().offset(16)
                make.right.equalTo(canselButton.snp.left).offset(-8)
                make.height.equalTo(32)
                make.top.equalTo(titleLable.snp.bottom).offset(8)
            }
        } else {
            canselButton.isHidden = true
            searchTableView.isHidden = true
            saveCityCollectionView.isHidden = false

            searchTextField.snp.remakeConstraints { (make) in
                make.left.equalToSuperview().offset(16)
                make.right.equalToSuperview().offset(-16)
                make.height.equalTo(32)
                make.top.equalTo(titleLable.snp.bottom).offset(8)
            }
        }
    }
}
