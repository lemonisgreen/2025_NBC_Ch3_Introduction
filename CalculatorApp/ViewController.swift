//
//  ViewController.swift
//  CalculatorApp
//
//  Created by 최규현 on 3/25/25.
//

import UIKit

class ViewController: UIViewController {
    let numLabel = UILabel()
    
    var button0 = UIButton()
    var button1 = UIButton()
    var button2 = UIButton()
    var button3 = UIButton()
    var button4 = UIButton()
    var button5 = UIButton()
    var button6 = UIButton()
    var button7 = UIButton()
    var button8 = UIButton()
    var button9 = UIButton()
    var buttonAdd = UIButton()
    var buttonSub = UIButton()
    var buttonMul = UIButton()
    var buttonDiv = UIButton()
    var buttonAC = UIButton()
    var buttonEqual = UIButton()
    
    var stackView1 = UIStackView()
    var stackView2 = UIStackView()
    var stackView3 = UIStackView()
    var stackView4 = UIStackView()
    let verticalStackView = UIStackView()
    
    var textValue = "0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
    }
    
    func calculate(expression: String) throws -> Int {
        guard textValue.last != "+" &&
                textValue.last != "-" &&
                textValue.last != "×" &&
                textValue.last != "/"
        else { throw CalculatorError.lastIsOperator }
        
        let replaced = expression.replacingOccurrences(of: "×", with: "*")
        let expression = NSExpression(format: replaced)
        
        if let result = expression.expressionValue(with: nil, context: nil) as? Int {
            return result
        } else {
            throw CalculatorError.failCalculation
        }
    }
    
    func lastElementIsOperator(_ input: String) {
        if textValue.last != "+" &&
        textValue.last != "-" &&
        textValue.last != "×" &&
        textValue.last != "/" {
            textValue += input
        }
    }
    
    func zeroCheck() {
        
    }
    
    enum CalculatorError: Error {
        case lastIsOperator
        case failCalculation
    }
    
    
    
    
    
    // ------------------- 버튼 액션 ------------------------
    
    @objc func num0Tapped() {
        if textValue != "0" {
            textValue += "0"
        }
        numLabel.text = textValue
    }
    
    @objc func num1Tapped() {
        if textValue != "0" {
            textValue += "1"
        } else {
            textValue = "1"
        }
        numLabel.text = textValue
    }
    
    @objc func num2Tapped() {
        if textValue != "0" {
            textValue += "2"
        } else {
            textValue = "2"
        }
        numLabel.text = textValue
    }
    
    @objc func num3Tapped() {
        if textValue != "0" {
            textValue += "3"
        } else {
            textValue = "3"
        }
        numLabel.text = textValue
    }
    
    @objc func num4Tapped() {
        if textValue != "0" {
            textValue += "4"
        } else {
            textValue = "4"
        }
        numLabel.text = textValue
    }
    
    @objc func num5Tapped() {
        if textValue != "0" {
            textValue += "5"
        } else {
            textValue = "5"
        }
        numLabel.text = textValue
    }
    
    @objc func num6Tapped() {
        if textValue != "0" {
            textValue += "6"
        } else {
            textValue = "6"
        }
        numLabel.text = textValue
    }
    
    @objc func num7Tapped() {
        if textValue != "0" {
            textValue += "7"
        } else {
            textValue = "7"
        }
        numLabel.text = textValue
    }
    
    @objc func num8Tapped() {
        if textValue != "0" {
            textValue += "8"
        } else {
            textValue = "8"
        }
        numLabel.text = textValue
    }
    
    @objc func num9Tapped() {
        if textValue != "0" {
            textValue += "9"
        } else {
            textValue = "9"
        }
        numLabel.text = textValue
    }
    
    @objc func addTapped() {
        lastElementIsOperator("+")
        numLabel.text = textValue
    }
    
    @objc func subTapped() {
        lastElementIsOperator("-")
        numLabel.text = textValue
    }
    
    @objc func mulTapped() {
        lastElementIsOperator("×")
        numLabel.text = textValue
    }
    
    @objc func divTapped() {
        lastElementIsOperator("/")
        numLabel.text = textValue
    }
    
    @objc func acTapped() {
        textValue = "0"
        numLabel.text = textValue
    }
    
    @objc func equalTapped() {
        do {
            
            textValue = try String(calculate(expression: textValue))
            numLabel.text = textValue
            
        } catch CalculatorError.lastIsOperator {
            textValue = "0"
            numLabel.text = "Error"
        } catch CalculatorError.failCalculation {
            textValue = "0"
            numLabel.text = "Error"
        } catch {
            numLabel.text = "Unknown Error"
        }
    }
    
}
