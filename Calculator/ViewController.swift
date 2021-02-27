//
//  ViewController.swift
//  Calculator
//
//  Created by user190856 on 2/19/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    private static var current_operation = [String]();
    private static var operandBuffer = [Float]();
    @IBOutlet weak var DisplayLabel: UILabel!
    
    @IBAction func processNumber(_ sender: UIButton) {
        if let numberText = sender.titleLabel?.text {
            if (DisplayLabel.text == "0"){
                DisplayLabel.text = numberText
            }
            else {
                DisplayLabel.text = DisplayLabel.text! + numberText
            }
        }
    }
    
    @IBAction func processOperation(_ sender: UIButton) {
        if let operatorText = sender.titleLabel?.text {
            ViewController.current_operation
                .append(operatorText);
            ViewController.operandBuffer
                .append((DisplayLabel.text! as NSString).floatValue);
            DisplayLabel.text = "";
        }
    }
    
    @IBAction func processEquals(_ sender: UIButton) {
        ViewController.operandBuffer.append((DisplayLabel.text! as NSString).floatValue);
        var result: Float = 0.0;
        for operand in ViewController.operandBuffer {
            var i = 0;
            switch ViewController.current_operation[i] {
            case "+":
                result = result + operand;
                break;
            case "-":
                result = result - operand;
                break;
            case "*":
                result = result * operand;
                break;
            case "/":
                result = result / operand;
                break;
            default:
                break;
                
            }
            i += 1;
        }
    }
    
}

