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
            DisplayLabel.text = "0";
        }
    }
    
    @IBAction func clearBuffers(_ sender: UIButton) {
        DisplayLabel.text = "0";
        ViewController.current_operation.removeAll();
        ViewController.operandBuffer.removeAll();
    }
    
    @IBAction func processEquals(_ sender: UIButton) {
        ViewController.operandBuffer.append((DisplayLabel.text! as NSString).floatValue);
        var result: Float = 0.0;
        //var temp: Float = 0.0;
        var i: Int = 0;
        for operand in ViewController.operandBuffer {
            if i == 0 {
                result = operand;
            }
            else {
                switch ViewController.current_operation[i - 1] {
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
            }
            i += 1;
        }
        
        DisplayLabel.text = String(result);
        ViewController.current_operation.removeAll();
        ViewController.operandBuffer.removeAll();
    }
    
}

