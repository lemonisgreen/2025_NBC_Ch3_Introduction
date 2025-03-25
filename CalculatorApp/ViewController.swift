//
//  ViewController.swift
//  CalculatorApp
//
//  Created by 최규현 on 3/25/25.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    private let result = UILabel()
    
    private var stackView1 = UIStackView()
    private var stackView2 = UIStackView()
    private var stackView3 = UIStackView()
    private var stackView4 = UIStackView()
    
    private let button0 = UIButton()
    private let button1 = UIButton()
    private let button2 = UIButton()
    private let button3 = UIButton()
    private let button4 = UIButton()
    private let button5 = UIButton()
    private let button6 = UIButton()
    private let button7 = UIButton()
    private let button8 = UIButton()
    private let button9 = UIButton()
    private let buttonAdd = UIButton()
    private let buttonSub = UIButton()
    private let buttonMul = UIButton()
    private let buttonDiv = UIButton()
    private let buttonEqual = UIButton()
    private let buttonAC = UIButton()
    
    var number = "0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
    }
    
    private func setUpUI() {
        view.backgroundColor = .black
        
        let numberButton = [button0, button1, button2, button3, button4, button5, button6, button7, button8, button9]
        let activeButton = [buttonAdd, buttonSub, buttonMul, buttonDiv, buttonEqual, buttonAC]
        let stackViews = [stackView1, stackView2, stackView3, stackView4]
        
        button0.setTitle("0", for: .normal)
        button1.setTitle("1", for: .normal)
        button2.setTitle("2", for: .normal)
        button3.setTitle("3", for: .normal)
        button4.setTitle("4", for: .normal)
        button5.setTitle("5", for: .normal)
        button6.setTitle("6", for: .normal)
        button7.setTitle("7", for: .normal)
        button8.setTitle("8", for: .normal)
        button9.setTitle("9", for: .normal)
        buttonAdd.setTitle("+", for: .normal)
        buttonSub.setTitle("-", for: .normal)
        buttonMul.setTitle("×", for: .normal)
        buttonDiv.setTitle("/", for: .normal)
        buttonEqual.setTitle("=", for: .normal)
        buttonAC.setTitle("AC", for: .normal)
        
        stackView1 = makeHorizontalStackView([buttonAC, button0, buttonEqual, buttonDiv])
        stackView2 = makeHorizontalStackView([button1, button2, button3, buttonMul])
        stackView3 = makeHorizontalStackView([button4, button5, button6, buttonSub])
        stackView4 = makeHorizontalStackView([button7, button8, button9, buttonAdd])
        
        numberButton.forEach {
            $0.setTitleColor(.white, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 30, weight: .bold)
            $0.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
            $0.layer.cornerRadius = 40
            $0.snp.makeConstraints { $0.height.width.equalTo(80) }
        }
        
        activeButton.forEach {
            $0.setTitleColor(.white, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 30, weight: .bold)
            $0.backgroundColor = .orange
            $0.layer.cornerRadius = 40
            $0.snp.makeConstraints { $0.height.width.equalTo(80) }
        }
        
        result.backgroundColor = .black
        result.textColor = .white
        result.font = .systemFont(ofSize: 60, weight: .bold)
        result.text = number
        result.textAlignment = .right
        
        view.addSubview(result)
        stackViews
            .forEach { view.addSubview($0) }
        
        result.snp.makeConstraints {
            $0.height.equalTo(100)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.top.equalToSuperview().offset(200)
        }
        
        stackView4.snp.makeConstraints {
            $0.width.equalTo(350)
            $0.top.equalTo(result.snp.bottom).offset(60)
            $0.centerX.equalToSuperview()
        }
        
        stackView3.snp.makeConstraints {
            $0.width.equalTo(stackView4.snp.width)
            $0.top.equalTo(stackView4.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }
        
        stackView2.snp.makeConstraints {
            $0.width.equalTo(stackView4.snp.width)
            $0.top.equalTo(stackView3.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }
        
        stackView1.snp.makeConstraints {
            $0.width.equalTo(stackView4.snp.width)
            $0.top.equalTo(stackView2.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }
    }
    
    private func makeHorizontalStackView(_ views: [UIView]) -> UIStackView {
        let view = UIStackView(arrangedSubviews: views)
        view.axis = .horizontal
        view.spacing = 10
        view.distribution = .fillEqually
        view.backgroundColor = .black
        view.snp.makeConstraints { $0.height.equalTo(80) }
        
        return view
    }
    
}

