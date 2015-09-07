//
//  TestingAlertExperimentTests.swift
//  TestingAlertExperimentTests
//
//  Created by Dominik Hauser on 02/09/15.
//  Copyright © 2015 Dominik Hauser. All rights reserved.
//

import XCTest
@testable import TestingAlertExperiment

class TestingAlertExperimentTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAlert_HasTitle() {
        let sut = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as! ViewController
        
        UIApplication.sharedApplication().keyWindow?.rootViewController = sut
        
        sut.Action = MockAlertAction.self
        
        sut.showAlert(UIButton())
        
        XCTAssertTrue(sut.presentedViewController is UIAlertController)
        XCTAssertEqual(sut.presentedViewController?.title, "Test Title")
        
        let alertController = sut.presentedViewController as! UIAlertController
        let action = alertController.actions.first as! MockAlertAction
        action.handler!(action)
        
    }
    
    class MockAlertAction : UIAlertAction {
        
        typealias Handler = ((UIAlertAction) -> Void)
        var handler: Handler?
        var mockTitle: String?
        var mockStyle: UIAlertActionStyle
        
        convenience init(title: String?, style: UIAlertActionStyle, handler: ((UIAlertAction) -> Void)?) {
            self.init()
            
            mockTitle = title
            mockStyle = style
            self.handler = handler
        }
        
        override init() {
            mockStyle = .Default
            
            super.init()
        }
    }
}
