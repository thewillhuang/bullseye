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
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    var currentValue: Int = 0
    var targetValue: Int = 0
    var score: Int = 0
    var round: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        startNewRound()
        updateLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startNewRound(){
        round += 1
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
    }
    
    func updateLabels(){
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    @IBAction func sliderMoved(slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
    @IBAction func showAlert() {
        let difference = abs(currentValue - targetValue)
        let points = 100 - difference
        score += points
        
        let message = "You scored \(points) points \n target is \(targetValue) you got \(currentValue)"
        
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
        
        updateLabels()
    }

}

