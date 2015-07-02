//
//  ViewController.swift
//  bullseye
//
//  Created by Wei liang huang on 6/29/15.
//  Copyright (c) 2015 Wei liang huang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    
    var currentValue: Int = 0
    var targetValue: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        currentValue = lroundf(slider.value)
        targetValue = 1 + Int(arc4random_uniform(100))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sliderMoved(slider: UISlider) {
        println("The value of the slider is now :\(slider.value)")
        currentValue = lroundf(slider.value)
    }
    
    @IBAction func showAlert() {
        let message = "the current value of the slider is: \(currentValue)"
                    + "\nThe target value is: \(targetValue)"
        
        let alert = UIAlertController(
            title: "Hello, World",
            message: message,
            preferredStyle: .Alert
        )
        
        let action = UIAlertAction(
            title: "Ok",
            style: .Default,
            handler: nil
        )
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
    }

}

