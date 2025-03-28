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
    
    let titleNum = Array(0...9).map { String($0) }
    let titleOper = ["+", "-", "*", "/", "AC", "="]
    
    let actionNum = [#selector(num0Tapped), #selector(num1Tapped), #selector(num2Tapped), #selector(num3Tapped), #selector(num4Tapped), #selector(num5Tapped), #selector(num6Tapped), #selector(num7Tapped), #selector(num8Tapped), #selector(num9Tapped)]
    let actionOper = [#selector(addTapped), #selector(subTapped), #selector(mulTapped), #selector(divTapped), #selector(acTapped), #selector(equalTapped)]
    
    var textValue = "0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
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
        do {            // "="버튼을 눌렀을 때 예외처리
            
            textValue = try String(calculate(expression: textValue))
            numLabel.text = textValue
            
        } catch CalculatorError.lastIsOperator {    // 식의 마지막 문자가 연산자일 때
            textValue = "0"
            numLabel.text = "Error"
        } catch CalculatorError.failCalculation {   // 계산에 실패한 경우
            textValue = "0"
            numLabel.text = "Error"
        } catch {
            textValue = "0"
            numLabel.text = "Unknown Error"
        }
    }
    
}
