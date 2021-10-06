//
//  AdministrativeAreaResponseModel.swift
//  WheatherAppIOS
//
//  Created by Rustam Keneev on 6/10/21.
//

import Foundation

class AdministrativeAreaResponseModel: Codable {

    var id: String? = nil
    var localizedName: String? = nil
    
    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case localizedName = "LocalizedName"
    }
}
