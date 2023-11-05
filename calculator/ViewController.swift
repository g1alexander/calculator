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
    var firstValue = 0.0
    var signOperation = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        value.text = "0"
    }
    
    @IBAction func divided(_ sender: UIButton) {
        DispatchQueue.main.async {
            self.value.text = "0"
        }
        firstValue = valueOperation
        signOperation = "/"
//        sender.layer.backgroundColor = UIColor.white.cgColor
//        sender.setTitleColor(UIColor(red: 254, green: 159, blue: 10, alpha: 1.0), for: .normal)
    }
    
    @IBAction func Multiplication(_ sender: UIButton) {
        DispatchQueue.main.async {
            self.value.text = "0"
        }
        firstValue = valueOperation
        signOperation = "*"
    }
    
    @IBAction func minus(_ sender: UIButton) {
        DispatchQueue.main.async {
            self.value.text = "0"
        }
        firstValue = valueOperation
        signOperation = "-"
    }
    
    @IBAction func sum(_ sender: UIButton) {
        DispatchQueue.main.async {
            self.value.text = "0"
        }
        firstValue = valueOperation
        signOperation = "+"
    }
    
    @IBAction func operation(_ sender: UIButton) {
        switch signOperation {
        case "/":
            let newValue = firstValue / valueOperation
            DispatchQueue.main.async { [self] in
                
                var convertString = ""
                
                if newValue.truncatingRemainder(dividingBy: 1) != 0 {
                     convertString = String(newValue).replacingOccurrences(of: ".", with: ",")
                } else {
                    convertString = "\(Int(newValue))"
                }
                
                value.text = "\(convertString)"
            }
        case "*":
            let newValue = firstValue * valueOperation
            DispatchQueue.main.async { [self] in
                
                var convertString = ""
                
                if newValue.truncatingRemainder(dividingBy: 1) != 0 {
                     convertString = String(newValue).replacingOccurrences(of: ".", with: ",")
                } else {
                    convertString = "\(Int(newValue))"
                }
                
                value.text = "\(convertString)"
            }
        case "-":
            let newValue = firstValue - valueOperation
            DispatchQueue.main.async { [self] in
                
                var convertString = ""
                
                if newValue.truncatingRemainder(dividingBy: 1) != 0 {
                     convertString = String(newValue).replacingOccurrences(of: ".", with: ",")
                } else {
                    convertString = "\(Int(newValue))"
                }
                
                value.text = "\(convertString)"
            }
        case "+":
            let newValue = firstValue + valueOperation
            DispatchQueue.main.async { [self] in
                
                var convertString = ""
                
                if newValue.truncatingRemainder(dividingBy: 1) != 0 {
                     convertString = String(newValue).replacingOccurrences(of: ".", with: ",")
                } else {
                    convertString = "\(Int(newValue))"
                }
                
                value.text = "\(convertString)"
            }
        default:
            print("Opción no reconocida")
        }
    }
    
    @IBAction func percentage(_ sender: UIButton) {
        let newValue = valueOperation / 100
        
        DispatchQueue.main.async { [self] in
            
            var convertString = ""
            
            if newValue.truncatingRemainder(dividingBy: 1) != 0 {
                 convertString = String(newValue).replacingOccurrences(of: ".", with: ",")
            } else {
                convertString = "\(Int(newValue))"
            }
            
            value.text = "\(convertString)"
        }
        
        valueOperation = newValue
        
        print(valueOperation)
        print(newValue)
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

