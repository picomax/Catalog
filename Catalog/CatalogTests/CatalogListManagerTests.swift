//
//  CatalogListManagerTests.swift
//  Catalog
//
//  Created by picomax on 2016. 6. 27..
//  Copyright © 2016년 picomax. All rights reserved.
//

import XCTest

class CatalogListManagerTests: XCTestCase {
    var catalogListManagerStub: CatalogListManagerStub!
    
    class CatalogListManagerStub: CatalogListManager {
        var doSomethingImportantCalled: Bool = false
        
        override func loadAll() {
            let path = NSBundle.mainBundle().pathForResource("CatalogInfo", ofType: "plist")!
            self.infoArray = NSArray(contentsOfFile: path)!
        }
    }
 
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        print("setUp()")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        
        print("tearDown()")
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testCatalogListManagerCount() {
        // Should be 13
        let catalogListManager: CatalogListManager! = CatalogListManager.sharedInstance
        catalogListManager.loadAll()
        let totalCount = catalogListManager.totalCount()
        
        let path = NSBundle.mainBundle().pathForResource("CatalogInfo", ofType: "plist")!
        let infoArray = NSArray(contentsOfFile: path)!
        
        XCTAssert(infoArray.count == 13)
        XCTAssertEqual(totalCount, infoArray.count)
    }

}
