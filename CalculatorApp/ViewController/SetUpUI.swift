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
        numLabel.lineBreakMode = .byTruncatingHead
        numLabel.adjustsFontSizeToFitWidth = true
        numLabel.text = textValue
        
        // 숫자 버튼 세팅
        makeButton(button: [button0, button1, button2,
                            button3, button4, button5,
                            button6, button7, button8, button9],
                   title: Array(0...9).map { String($0) },
                   backgroundColor: UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0))
        // 연산자 버튼 세팅
        makeButton(button: [buttonAdd, buttonSub,
                            buttonMul, buttonDiv,
                            buttonAC, buttonEqual],
                   title: ["+", "-", "×", "/", "AC", "="],
                   backgroundColor: .orange)
        
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
    func makeButton(button: [UIButton], title: [String], backgroundColor: UIColor) {
        
        for (button, title) in zip(button, title) {
            button.setTitle(title, for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 30, weight: .bold)
            button.setBackgroundColor(backgroundColor, for: .normal)
            button.layer.cornerRadius = 40
            button.layer.masksToBounds = true
            button.addTarget(self, action: #selector(calculationButtonTapped), for: .touchUpInside)
            button.snp.makeConstraints { $0.width.height.equalTo(80) }
        }
    }
    
}

/*
 button.backgroundColor 로 백그라운드 컬러 생성 시
 버튼의 클릭 이펙트가 출력되지 않는 현상 개션을 위해
 버튼의 상태별 백그라운드 컬러를 지정할 수 있는 메서드를 생성
 */
extension UIButton {
    func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
        UIGraphicsBeginImageContext(CGSize(width: 1.0, height: 1.0))
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setFillColor(color.cgColor)
        context.fill(CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0))
        
        let backgroundImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        setBackgroundImage(backgroundImage, for: state)
    }
}
