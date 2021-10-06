//
//  AdministrativeAreaDataBaseModel.swift
//  WheatherAppIOS
//
//  Created by Rustam Keneev on 6/10/21.
//

import Foundation
import RealmSwift

class AdministrativeAreaDataBaseModel: Object {
    @objc dynamic var id: String? = nil
    @objc dynamic var localizedName: String? = nil
}
