//
//  CatalogModel.swift
//  Catalog
//
//  Created by picomax on 2016. 6. 24..
//  Copyright © 2016년 picomax. All rights reserved.
//

import UIKit

class CatalogModel: NSObject {
    var title: String = ""
    var subtitle: String = ""
    var desc: String = ""
    var homepage: String = ""
    var photo: String = ""
    var thumbnail1: String = ""
    var thumbnail2: String = ""
    var thumbnail3: String = ""
    var score: String = ""
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        print("forUndefinedKey = \(key)")
    }
}