//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    
    override func viewDidLoad() {
        heightLabel.text = "0.0"
        weightLabel.text = "0"
    }
    
    @IBAction func heightSliderChange(_ sender: UISlider) {
        let currentValue = String(format: "%.2f", sender.value)
        heightLabel.text = "\(currentValue) m"
    }
    
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var weightSlider: UISlider!
    @IBAction func weightSliderChange(_ sender: UISlider) {
        let currentValue = String(format: "%.0f", sender.value)
        weightLabel.text = "\(currentValue) kg"
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
//        let bmi = weight / pow(height, 2)
//        bmiValue = String(format: "%.1f", bmi)
        calculatorBrain.calculateBMI(height: height, weight: weight)
        
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }


}

