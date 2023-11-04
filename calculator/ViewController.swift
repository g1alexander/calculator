//
//  ViewController.swift
//  calculator
//
//  Created by g1alexander on 10/25/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var value: UILabel!
    
    var valueOperation = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        value.text = "0"
    }

    @IBAction func resetValue(_ sender: UIButton) {
        value.text = "0"
        valueOperation = 0.0
    }
    
    @IBAction func convertValue(_ sender: UIButton) {
        valueOperation = -valueOperation
        
        if valueOperation.truncatingRemainder(dividingBy: 1) != 0 {
            let convertString = String(valueOperation).replacingOccurrences(of: ".", with: ",")
            
            DispatchQueue.main.async {
                self.value.text = convertString
            }
        } else {
            DispatchQueue.main.async {
                self.value.text = "\(Int(self.valueOperation))"
            }
        }
    }
    
    @IBAction func nums(_ sender: UIButton) {
        let num = sender.titleLabel?.text ?? "0"
        
        if value.text == "0" {
            value.text = num
        } else {
            value.text = "\(value.text ?? "")\(num)"
        }
        
        let formattedString = value.text?.replacingOccurrences(of: ",", with: ".") ?? ""

        if let doubleValue = Double(formattedString) {
            valueOperation = doubleValue
        } else {
            print("No se pudo convertir el string a Double.")
        }
        
    }
    
}

