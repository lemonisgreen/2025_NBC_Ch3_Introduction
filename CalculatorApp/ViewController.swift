//
//  ViewController.swift
//  CalculatorApp
//
//  Created by 최규현 on 3/25/25.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    private let numLabel = UILabel()
    
    private var button0 = UIButton()
    private var button1 = UIButton()
    private var button2 = UIButton()
    private var button3 = UIButton()
    private var button4 = UIButton()
    private var button5 = UIButton()
    private var button6 = UIButton()
    private var button7 = UIButton()
    private var button8 = UIButton()
    private var button9 = UIButton()
    private var buttonAdd = UIButton()
    private var buttonSub = UIButton()
    private var buttonMul = UIButton()
    private var buttonDiv = UIButton()
    private var buttonEqual = UIButton()
    private var buttonAC = UIButton()
    
    private var stackView1 = UIStackView()
    private var stackView2 = UIStackView()
    private var stackView3 = UIStackView()
    private var stackView4 = UIStackView()
    private let verticalStackView = UIStackView()
    
    var textValue = "0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
    }
    
    private func setUpUI() {
        view.backgroundColor = .black
        
        button0 = makeButton(titleValue: "0", action: #selector(num0Tapped), backgroundColor: UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0))
        button1 = makeButton(titleValue: "1", action: #selector(num1Tapped), backgroundColor: UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0))
        button2 = makeButton(titleValue: "2", action: #selector(num2Tapped), backgroundColor: UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0))
        button3 = makeButton(titleValue: "3", action: #selector(num3Tapped), backgroundColor: UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0))
        button4 = makeButton(titleValue: "4", action: #selector(num4Tapped), backgroundColor: UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0))
        button5 = makeButton(titleValue: "5", action: #selector(num5Tapped), backgroundColor: UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0))
        button6 = makeButton(titleValue: "6", action: #selector(num6Tapped), backgroundColor: UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0))
        button7 = makeButton(titleValue: "7", action: #selector(num7Tapped), backgroundColor: UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0))
        button8 = makeButton(titleValue: "8", action: #selector(num8Tapped), backgroundColor: UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0))
        button9 = makeButton(titleValue: "9", action: #selector(num9Tapped), backgroundColor: UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0))
        buttonAdd = makeButton(titleValue: "+", action: #selector(addTapped), backgroundColor: .orange)
        buttonSub = makeButton(titleValue: "-", action: #selector(subTapped), backgroundColor: .orange)
        buttonMul = makeButton(titleValue: "×", action: #selector(mulTapped), backgroundColor: .orange)
        buttonDiv = makeButton(titleValue: "/", action: #selector(divTapped), backgroundColor: .orange)
        buttonEqual = makeButton(titleValue: "=", action: #selector(equalTapped), backgroundColor: .orange)
        buttonAC = makeButton(titleValue: "AC", action: #selector(acTapped), backgroundColor: .orange)
        
        stackView1 = makeHorizontalStackView([button7, button8, button9, buttonAdd])
        stackView2 = makeHorizontalStackView([button4, button5, button6, buttonSub])
        stackView3 = makeHorizontalStackView([button1, button2, button3, buttonMul])
        stackView4 = makeHorizontalStackView([buttonAC, button0, buttonEqual, buttonDiv])
        
        numLabel.textColor = .white
        numLabel.font = .systemFont(ofSize: 60, weight: .bold)
        numLabel.textAlignment = .right
        numLabel.backgroundColor = .black
        numLabel.text = textValue
        
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 10
        verticalStackView.distribution = .fillEqually
        verticalStackView.backgroundColor = .black
        
        [stackView1, stackView2, stackView3, stackView4]
            .forEach { verticalStackView.addArrangedSubview($0) }
        
        [numLabel, verticalStackView]
            .forEach { view.addSubview($0) }
        
        numLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.top.equalToSuperview().offset(200)
        }
        
        verticalStackView.snp.makeConstraints {
            $0.width.equalTo(350)
            $0.top.equalTo(numLabel.snp.bottom).offset(60)
            $0.centerX.equalToSuperview()
        }
    }
    
    func makeHorizontalStackView(_ views: [UIView]) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.backgroundColor = .black
        stackView.snp.makeConstraints { $0.height.equalTo(80) }
        
        return stackView
    }
    
    func makeButton(titleValue: String, action: Selector, backgroundColor: UIColor) -> UIButton {
        let button = UIButton()
        button.setTitle(titleValue, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 30, weight: .bold)
        button.backgroundColor = backgroundColor
        button.layer.cornerRadius = 40
        button.addTarget(self, action: action, for: .touchDown)
        button.snp.makeConstraints { $0.width.height.equalTo(80) }
        
        return button
    }
    
    func calculate(expression: String) -> Int? {
        let replaced = expression.replacingOccurrences(of: "×", with: "*")
        let expression = NSExpression(format: replaced)
        if let result = expression.expressionValue(with: nil, context: nil) as? Int {
            return result
        } else {
            return nil
        }
    }
    
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
        textValue += "+"
        numLabel.text = textValue
    }
    
    @objc func subTapped() {
        textValue += "-"
        numLabel.text = textValue
    }
    
    @objc func mulTapped() {
        textValue += "×"
        numLabel.text = textValue
    }
    
    @objc func divTapped() {
        textValue += "/"
        numLabel.text = textValue
    }
    
    @objc func equalTapped() {
        if let value = calculate(expression: textValue) {
            textValue = String(value)
        } else {
            textValue = "Error"
        }
        
        numLabel.text = textValue
    }
    
    @objc func acTapped() {
        textValue = "0"
        numLabel.text = textValue
    }
}
