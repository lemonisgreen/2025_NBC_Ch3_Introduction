//
//  Untitled.swift
//  CalculatorApp
//
//  Created by 최규현 on 3/26/25.
//
import UIKit
import SnapKit

extension ViewController {
    
    // 뷰 로드 시 실행될 UI세팅
    func setUpUI() {
        view.backgroundColor = .black
        
        // 라벨 세팅
        numLabel.textColor = .white
        numLabel.font = .systemFont(ofSize: 60, weight: .bold)
        numLabel.textAlignment = .right
        numLabel.backgroundColor = .black
        numLabel.text = textValue
        
        // 버튼 세팅
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
        buttonAC = makeButton(titleValue: "AC", action: #selector(acTapped), backgroundColor: .orange)
        buttonEqual = makeButton(titleValue: "=", action: #selector(equalTapped), backgroundColor: .orange)
        
        // 호리즌탈 스택뷰 세팅
        stackView1 = makeHorizontalStackView([button7, button8, button9, buttonAdd])
        stackView2 = makeHorizontalStackView([button4, button5, button6, buttonSub])
        stackView3 = makeHorizontalStackView([button1, button2, button3, buttonMul])
        stackView4 = makeHorizontalStackView([buttonAC, button0, buttonEqual, buttonDiv])
        
        // 버티컬 스택뷰 세팅
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 10
        verticalStackView.distribution = .fillEqually
        verticalStackView.backgroundColor = .black
        
        // 버티컬 스택뷰에 호리즌탈 스택뷰 추가
        [stackView1, stackView2, stackView3, stackView4]
            .forEach { verticalStackView.addArrangedSubview($0) }
        
        // 라벨, 스택뷰를 뷰에 로딩
        [numLabel, verticalStackView]
            .forEach { view.addSubview($0) }
        
        // 라벨 오토레이아웃
        numLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.top.equalToSuperview().offset(200)
        }
        
        // 스택뷰 오토레아이웃
        verticalStackView.snp.makeConstraints {
            $0.width.equalTo(350)
            $0.top.equalTo(numLabel.snp.bottom).offset(60)
            $0.centerX.equalToSuperview()
        }
    }
    
    // 호리즌탈 스택뷰를 세팅하는 메서드
    func makeHorizontalStackView(_ views: [UIView]) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.backgroundColor = .black
        stackView.snp.makeConstraints { $0.height.equalTo(80) }
        
        return stackView
    }
    
    // 버튼을 세팅하는 메서드
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
    
}
