//
//  CatalogListManager.swift
//  Catalog
//
//  Created by picomax on 2016. 6. 24..
//  Copyright © 2016년 picomax. All rights reserved.
//

import UIKit

let CataloagListUserDefaultsKey = "CataloagListUserDefaultsKey"

private let sharedCatalogListManager = CatalogListManager()

class CatalogListManager {
    var infoArray:NSArray!
    
    private init() {
        self.loadAll()
    }
    
    class var sharedInstance: CatalogListManager {
        return sharedCatalogListManager
    }
    
    func loadAll() {
        let path = NSBundle.mainBundle().pathForResource("CatalogInfo", ofType: "plist")!
        self.infoArray = NSArray(contentsOfFile: path)!
    }
    
    func totalCount() -> Int {
        return self.infoArray.count
    }
    
    func catalogModelAtIndex(index:Int) -> CatalogModel {
        let dic = infoArray[index] as! Dictionary<String,String>
        let catalogModel = CatalogModel()

        for (_, (key, value)) in dic.enumerate() {
            if(key == "description"){
                catalogModel.setValue(value, forKey: "desc")
            }else{
                catalogModel.setValue(value, forKey: key)
            }
        }
/*
        if dic["title"] != nil {
            catalogModel.title = dic["title"]!
        }
        if dic["description"] != nil {
            catalogModel.desc = dic["description"]!
        }
        if dic["phone"] != nil {
            catalogModel.phone = dic["phone"]!
        }
        if dic["address"] != nil {
            catalogModel.address = dic["address"]!
        }
        if dic["homdpage"] != nil {
            catalogModel.homdpage = dic["homdpage"]!
        }
        if dic["photo"] != nil {
            catalogModel.photo = dic["photo"]!
        }
        if dic["thumbnail1"] != nil {
            catalogModel.thumbnail1 = dic["thumbnail1"]!
        }
        if dic["thumbnail2"] != nil {
            catalogModel.thumbnail2 = dic["thumbnail2"]!
        }
        if dic["thumbnail3"] != nil {
            catalogModel.thumbnail3 = dic["thumbnail3"]!
        }
        if dic["score"] != nil {
            catalogModel.score = dic["score"]!
        }
*/
        return catalogModel
    }
}