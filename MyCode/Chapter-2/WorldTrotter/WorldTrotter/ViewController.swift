//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Claude Botes on 09/05/2017.
//  Copyright © 2017 cfb. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController {
    
    // MARK: Variables
    
    // MARK: Outlets
    
    @IBOutlet weak var celsiusLabel: UILabel!
    @IBOutlet weak var fahrenheitTextField: UITextField!
    
    // MARK: Properties
    
    var celsiusValue: Measurement<UnitTemperature>?{
        if let fahrenheitValue = fahrenheitValue {
            return fahrenheitValue.converted(to: .celsius)
        } else {
            return nil
        }
    }
    
    var fahrenheitValue: Measurement<UnitTemperature>? {
        didSet {
            updateCelsiusLabel()
        }
    }
    
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()

    // MARK Events
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        updateCelsiusLabel()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Functions
    
    func updateCelsiusLabel() {
        if let celsiusValue = celsiusValue {
            celsiusLabel.text = numberFormatter.string(from: NSNumber(value: celsiusValue.value))
        } else {
            celsiusLabel.text = "???"
        }
    }
    
    // MARK: Actions

    @IBAction func fahrenheitTextFieldChanged(_ sender: UITextField) {
        
        if let text = fahrenheitTextField.text, let value = Double(text) {
            fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
        } else {
            fahrenheitValue = nil
        }
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        fahrenheitTextField.resignFirstResponder()
    }
    

}

