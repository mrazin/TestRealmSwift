//
//  Model.swift
//  authTest
//
//  Created by WSR on 14/11/2019.
//  Copyright © 2019 WSR. All rights reserved.
//

import Foundation
import RealmSwift

class Poroda: Object {
     @objc dynamic var id = ""
   @objc dynamic var name = ""
   @objc dynamic  var image = ""
    override static func primaryKey() -> String? {
        return "id"
    }
}
