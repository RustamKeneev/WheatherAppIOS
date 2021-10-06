//
//  BaseViewModel.swift
//  WheatherAppIOS
//
//  Created by Rustam Keneev on 6/10/21.
//

import Foundation

class BaseViewModel {
    var apiClient = ApiRepository.newInstanse()
    var dataBase = DataBaseRepository.newInstanse()
}
