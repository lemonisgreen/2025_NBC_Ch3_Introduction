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
    
    func addOperator(_ input: String) {
        if textValue.last != "+" &&
        textValue.last != "-" &&
        textValue.last != "×" &&
        textValue.last != "/" {
            textValue += input
        }
        
        numLabel.text = textValue
    }
    
    func addZero() {
        guard textValue != "0" else { return }
        
        if textValue.last != "+" &&
        textValue.last != "-" &&
        textValue.last != "×" &&
        textValue.last != "/" {
            textValue += "0"
        }
        
        numLabel.text = textValue
    }
    
    func addNumber(_ number: String) {
        if textValue != "0" {
            textValue += number
        } else {
            textValue = number
        }
        
        numLabel.text = textValue
    }
    
    enum CalculatorError: Error {
        case lastIsOperator
        case failCalculation
    }
    
    
    
    
    
    // ------------------- 버튼 액션 ------------------------
    
    @objc func num0Tapped() {
        addZero()
    }
    
    @objc func num1Tapped() {
        addNumber("1")
    }
    
    @objc func num2Tapped() {
        addNumber("2")
    }
    
    @objc func num3Tapped() {
        addNumber("3")
    }
    
    @objc func num4Tapped() {
        addNumber("4")
    }
    
    @objc func num5Tapped() {
        addNumber("5")
    }
    
    @objc func num6Tapped() {
        addNumber("6")
    }
    
    @objc func num7Tapped() {
        addNumber("7")
    }
    
    @objc func num8Tapped() {
        addNumber("8")
    }
    
    @objc func num9Tapped() {
        addNumber("9")
    }
    
    @objc func addTapped() {
        addOperator("+")
    }
    
    @objc func subTapped() {
        addOperator("-")
    }
    
    @objc func mulTapped() {
        addOperator("×")
    }
    
    @objc func divTapped() {
        addOperator("/")
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
            textValue = "0"
            numLabel.text = "Unknown Error"
        }
    }
    
}
