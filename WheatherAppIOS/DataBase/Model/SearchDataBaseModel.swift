//
//  SearchDataBaseModel.swift
//  WheatherAppIOS
//
//  Created by Rustam Keneev on 6/10/21.
//

import Foundation
import RealmSwift

class SearchDataBaseModel: Object {
    @objc dynamic var key: String? = nil
    @objc dynamic var type: String? = nil
    @objc dynamic var localizedName: String? = nil

    @objc dynamic var country: CountryDataBaseModel? = nil
    @objc dynamic var administrativeArea: AdministrativeAreaDataBaseModel? = nil
}
