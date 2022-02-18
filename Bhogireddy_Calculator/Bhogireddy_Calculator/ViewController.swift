//
//  ViewController.swift
//  Bhogireddy_Calculator
//
//  Created by Bhogireddy,Vamsi on 2/17/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var displayLabel: UILabel!
    
    var firstOperand = ""
    var secondOperand = ""
    var operation = ""
    var operatorChange = false
    var currentNumber = ""
    var multiOperators = false
    var result = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func btnAC(_ sender: UIButton) {
        
        secondOperand = ""
        firstOperand = ""
        operatorChange = false
                        operation = ""
        currentNumber = ""
                        displayLabel.text = "0"
        multiOperators=false
    }
    @IBAction func btnC(_ sender: UIButton) {
        
        secondOperand = ""
                displayLabel.text = ""
    }
    @IBAction func btnSignChange(_ sender: UIButton) {
        
        if firstOperand != "" {
                          
                          displayLabel.text = "-" + displayLabel.text!
                          firstOperand = "\(displayLabel.text!)"
                      }
                      else{
                          displayLabel.text = "-" + displayLabel.text!
                          secondOperand = "\(displayLabel.text!)"
                      }
    }
    @IBAction func btnDiv(_ sender: UIButton) {
        
        let value = calc(operation)
                        operation = "/"
                        displayLabel.text = (value != "") ? resultFormat(value) : ""
                        if value != "" {
                            if secondOperand != ""{
                                multiOperators = true
                                if operatorChange {
                                    result = String(Double(value)! / Double(secondOperand)!)
                                    if result == "inf"{
                                        displayLabel.text! = "Error"
                                    }else{
                                        displayLabel.text! = resultFormat(result)
                                    }
                                }
                            }
                        }
        operatorChange = true
    }
    @IBAction func btnMul(_ sender: UIButton) {
        
        let temp = calc(operation)
                      operation = "*"
                      currentNumber=""
                      displayLabel.text = (temp != "") ? resultFormat(temp) : ""
                      operatorChange=true
                      displayLabel.text = ""
    }
    @IBAction func btnSub(_ sender: UIButton) {
        
        let temp = calc(operation)
                        operation = "-"
                        displayLabel.text = (temp != "") ? resultFormat(temp) : ""
                        if temp != "" {
                                    if secondOperand != ""{
                                multiOperators = true
                                currentNumber = secondOperand;
                                if operatorChange {
                                    result = String(Double(temp)! - Double(secondOperand)!)
                                    displayLabel.text! = resultFormat(result)
                                }
                            }
                        }
                        operatorChange = true
         
    }
    @IBAction func btnAdd(_ sender: UIButton) {
        let temp = calc(operation)
                       operation = "+"
                       currentNumber=""
                       displayLabel.text = (temp != "") ? resultFormat(temp) : ""
                       operatorChange=true
                       displayLabel.text = ""
        
    }
    @IBAction func btnEquals(_ sender: UIButton) {
        var res = ""
                        switch operation {
                        case "+":
                            
                            if currentNumber != "" {
                                res = String(Double(firstOperand)! + Double(currentNumber)!)
                                displayLabel.text = resultFormat(res)
                                 secondOperand = currentNumber
                            }else{
                                res = String(Double(firstOperand)! + Double(secondOperand)!)
                                displayLabel.text = resultFormat(res)
                            }
                            firstOperand = res
                            
                            break
                        case "*":
                            if currentNumber != "" {
                                res = String(Double(firstOperand)! * Double(currentNumber)!)
                                displayLabel.text = resultFormat(res)
                            }else{
                                res = String(Double(firstOperand)! * Double(secondOperand)!)
                                displayLabel.text = resultFormat(res)
                            }
                            firstOperand = res
                            
                            break
                        case "%":
                            if currentNumber != "" {
                                res = String(Double(firstOperand)!.truncatingRemainder(dividingBy: Double(currentNumber)!))
                                displayLabel.text = resultFormat(res)
                            }else{
                                res = String(Double(firstOperand)!.truncatingRemainder(dividingBy: Double(secondOperand)!))
                                displayLabel.text = resultFormat(res)
                            }
                            firstOperand = res
                            
                            break
                        case "-":
                            if currentNumber != "" {
                                res = String(Double(firstOperand)! - Double(currentNumber)!)
                                displayLabel.text = resultFormat(res)
                                //                number2 = ""
                            }else{
                                res = String(Double(firstOperand)! - Double(secondOperand)!)
                                displayLabel.text = resultFormat(res)
                            }
                            firstOperand = res
                            break
                        case "/":
                            if displayLabel.text == "Error"{
                                secondOperand = ""
                                firstOperand = ""
                                operatorChange = false
                                operation = ""
                                currentNumber = ""
                                displayLabel.text = "0"
                                multiOperators=false
                            }else{
                                if currentNumber != "" {
                                    res = String(Double(firstOperand)! / Double(currentNumber)!)
                                    if res == "inf"{
                                        displayLabel.text! = "Error"
                                        return
                                    }else{
                                        displayLabel.text = resultFormat(res)
                                    }
                                }else{
                                    res = String(Double(firstOperand)! / Double(secondOperand)!)
                                    if res == "inf"{
                                        displayLabel.text! = "Error"
                                        return
                                    }else{
                                        displayLabel.text = resultFormat(res)
                                    }
                                }
                                firstOperand = res
                            }
                            break
                        default:
                            print("Nothing")
                        }
                        
        
    }
    @IBAction func btnMod(_ sender: UIButton) {
        let temp = calc(operation)
                        operation = "%"
                        currentNumber=""
                        displayLabel.text = (temp != "") ? resultFormat(temp) : ""
                        operatorChange=true
                        displayLabel.text = ""
    }
    @IBAction func btnDot(_ sender: UIButton) {
        let number = "."
                        if displayLabel.text == "0"{
                            displayLabel.text = ""
                        }
                                       if !operatorChange {
                                           displayLabel.text! += number
                                           firstOperand += number
                                       }else{
                                           if !multiOperators {
                                               displayLabel.text! += number
                                               secondOperand += number
                                           }else {
                                               displayLabel.text = ""
                                               displayLabel.text! += number
                                               secondOperand += number
                                           }
                                       }
        
    }
    @IBAction func btnZero(_ sender: UIButton) {
        let number = "0"
                       if displayLabel.text == "0"{
                           displayLabel.text = ""
                          
                       }
                       if !operatorChange {
                           displayLabel.text! += number
                           firstOperand += number
                       }else{
                           if !multiOperators {
                               displayLabel.text! += number
                               secondOperand += number
                           }else {
                               displayLabel.text = ""
                               displayLabel.text! += number
                               secondOperand += number
                           }
                       }
         
    }
    
    @IBAction func btnOne(_ sender: UIButton) {
        let number = "1"
                        if displayLabel.text == "0"{
                            displayLabel.text = ""
                           
                        }
                        if !operatorChange {
                            displayLabel.text! += number
                            firstOperand += number
                        }else{
                            if !multiOperators {
                                displayLabel.text! += number
                                secondOperand += number
                            }else {
                                displayLabel.text = ""
                                displayLabel.text! += number
                                secondOperand += number
                            }
                        }
        
    }
    
    @IBAction func btnTwo(_ sender: UIButton) {
        let number = "2"
                        if displayLabel.text == "0"{
                            displayLabel.text = ""
                           
                        }
                        if !operatorChange {
                            displayLabel.text! += number
                            firstOperand += number
                        }else{
                            if !multiOperators {
                                displayLabel.text! += number
                                secondOperand += number
                            }else {
                                displayLabel.text = ""
                                displayLabel.text! += number
                                secondOperand += number
                            }
                        }
    }
    @IBAction func btnThree(_ sender: UIButton) {
        let number = "3"
                        if displayLabel.text == "0"{
                            displayLabel.text = ""
                           
                        }
                        if !operatorChange {
                            displayLabel.text! += number
                            firstOperand += number
                        }else{
                            if !multiOperators {
                                displayLabel.text! += number
                                secondOperand += number
                            }else {
                                displayLabel.text = ""
                                displayLabel.text! += number
                                secondOperand += number
                            }
                        }
    }
    @IBAction func btnFour(_ sender: UIButton) {
        let number = "4"
                        if displayLabel.text == "0"{
                            displayLabel.text = ""
                           
                        }
                        if !operatorChange {
                            displayLabel.text! += number
                            firstOperand += number
                        }else{
                            if !multiOperators {
                                displayLabel.text! += number
                                secondOperand += number
                            }else {
                                displayLabel.text = ""
                                displayLabel.text! += number
                                secondOperand += number
                            }
                        }
    }
    @IBAction func btnFive(_ sender: UIButton) {
        let number = "5"
                        if displayLabel.text == "0"{
                            displayLabel.text = ""
                           
                        }
                        if !operatorChange {
                            displayLabel.text! += number
                            firstOperand += number
                        }else{
                            if !multiOperators {
                                displayLabel.text! += number
                                secondOperand += number
                            }else {
                                displayLabel.text = ""
                                displayLabel.text! += number
                                secondOperand += number
                            }
                        }
    }
    @IBAction func btnSix(_ sender: UIButton) {
        let number = "6"
                        if displayLabel.text == "0"{
                            displayLabel.text = ""
                           
                        }
                        if !operatorChange {
                            displayLabel.text! += number
                            firstOperand += number
                        }else{
                            if !multiOperators {
                                displayLabel.text! += number
                                secondOperand += number
                            }else {
                                displayLabel.text = ""
                                displayLabel.text! += number
                                secondOperand += number
                            }
                        }
    }
    @IBAction func btnSeven(_ sender: UIButton) {
        let number = "7"
                        if displayLabel.text == "0"{
                            displayLabel.text = ""
                           
                        }
                        if !operatorChange {
                            displayLabel.text! += number
                            firstOperand += number
                        }else{
                            if !multiOperators {
                                displayLabel.text! += number
                                secondOperand += number
                            }else {
                                displayLabel.text = ""
                                displayLabel.text! += number
                                secondOperand += number
                            }
                        }
    }
    @IBAction func btnEight(_ sender: UIButton) {
        let number = "8"
                        if displayLabel.text == "0"{
                            displayLabel.text = ""
                           
                        }
                        if !operatorChange {
                            displayLabel.text! += number
                            firstOperand += number
                        }else{
                            if !multiOperators {
                                displayLabel.text! += number
                                secondOperand += number
                            }else {
                                displayLabel.text = ""
                                displayLabel.text! += number
                                secondOperand += number
                            }
                        }
    }
    @IBAction func btnNine(_ sender: UIButton) {
        let number = "9"
                        if displayLabel.text == "0"{
                            displayLabel.text = ""
                           
                        }
                        if !operatorChange {
                            displayLabel.text! += number
                            firstOperand += number
                        }else{
                            if !multiOperators {
                                displayLabel.text! += number
                                secondOperand += number
                            }else {
                                displayLabel.text = ""
                                displayLabel.text! += number
                                secondOperand += number
                            }
                        }
    }
    func calc(_ operation:String)->String {
                if firstOperand != "" && secondOperand != ""{
                    if operation == "+"{
                        firstOperand = String(Double(firstOperand)! + Double(secondOperand)!)
                        currentNumber = secondOperand
                        secondOperand = ""
                        return String(firstOperand)
                    }
                    if operation == "-"{
                        firstOperand = String(Double(firstOperand)! - Double(secondOperand)!)
                        currentNumber = secondOperand
                        secondOperand = ""
                        return String(firstOperand)
                    }
                    if operation == "*"{
                        firstOperand = String(Double(firstOperand)! * Double(secondOperand)!)
                        currentNumber = secondOperand
                        secondOperand = ""
                        return String(firstOperand)
                    }
                    if operation == "/"{
                        firstOperand = String(Double(firstOperand)! / Double(secondOperand)!)
                        currentNumber = secondOperand
                        secondOperand = ""
                        return String(firstOperand)
                    }
                    if operation == "%"{
                        firstOperand = String(Double(firstOperand)!.truncatingRemainder(dividingBy: Double(secondOperand)!))
                        currentNumber = secondOperand
                        secondOperand = ""
                        return String(firstOperand)
                    }
                }
                return ""
            }
        func resultFormat(_ result:String)->String {
                let value = Double(result)!
                var resultStr = String(round(value * 100000) / 100000.0)
                
                if resultStr.contains(".0"){
                    resultStr.removeSubrange(resultStr.index(resultStr.endIndex, offsetBy: -2)..<resultStr.endIndex)
                }
                
                return resultStr
            }
    
    
}

