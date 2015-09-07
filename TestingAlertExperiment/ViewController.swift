//
//  ViewController.swift
//  TestingAlertExperiment
//
//  Created by Dominik Hauser on 02/09/15.
//  Copyright © 2015 Dominik Hauser. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var Action = UIAlertAction.self
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert(sender: UIButton) {
        let alertViewController = UIAlertController(title: "Test Title", message: "Message", preferredStyle: .Alert)
        
        let okAction = Action.init(title: "OK", style: .Default) { (action) -> Void in
            print("hello")
        }
        
        alertViewController.addAction(okAction)
        
        presentViewController(alertViewController, animated: true, completion: nil)
    }
}
