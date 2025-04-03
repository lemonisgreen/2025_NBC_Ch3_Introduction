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
    
    // 버튼 액션
    @objc func calculationButtonTapped(_ sender: UIButton) {
        addNumber(sender.currentTitle ?? "0")
    }
    
}
//#Preview { ViewController() }
