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
  
  var sut: ViewController!
  
  override func setUp() {
    super.setUp()
    
    sut = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as? ViewController
    
    UIApplication.shared.keyWindow?.rootViewController = sut
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testAlert_HasTitle() {
    sut.showAlert(sender: UIButton())
    
    XCTAssertTrue(sut.presentedViewController is UIAlertController)
    XCTAssertEqual(sut.presentedViewController?.title, "Test Title")
  }
  
  func testAlert_FirstActionStoresCancel() {
    sut.Action = MockAlertAction.self
    
    sut.showAlert(sender: UIButton())
    
    let alertController = sut.presentedViewController as! UIAlertController
    let action = alertController.actions.first as! MockAlertAction
    action.mockHandler!(action)
    
    XCTAssertEqual(sut.actionString, "Cancel")
    XCTAssertEqual(action.mockTitle, "Cancel")
  }
  
  func testAlert_SecondActionStoresOK() {
    sut.Action = MockAlertAction.self
    
    sut.showAlert(sender: UIButton())
    
    let alertController = sut.presentedViewController as! UIAlertController
    let action = alertController.actions[1] as! MockAlertAction
    action.mockHandler!(action)
    
    XCTAssertEqual(sut.actionString, "OK")
    XCTAssertEqual(action.mockTitle, "OK")
  }
  
  class MockAlertAction : UIAlertAction {
    
    typealias Handler = ((UIAlertAction) -> Void)
    var mockHandler: Handler?
    var mockTitle: String?
    var mockStyle: UIAlertAction.Style
    
    convenience init(title: String?, style: UIAlertAction.Style, handler: ((UIAlertAction) -> Void)?) {
      self.init()
      
      mockTitle = title
      mockStyle = style
      self.mockHandler = handler
    }
    
    override init() {
        mockStyle = .default
      
      super.init()
    }
    
    override class func makeActionWithTitle(title: String?, style: UIAlertAction.Style, handler: ((UIAlertAction) -> Void)?) -> MockAlertAction {
      return MockAlertAction(title: title, style: style, handler: handler)
    }
  }
}
