//
//  ViewController.swift
//  Calculator
//
//  Created by JIN LEE on 3/28/25.
//

import UIKit

class ViewController: UIViewController {
    
    let label = UILabel()
    
    let acButton: UIButton = UIButton()
    let zeroButton: UIButton = UIButton()
    let equalButton: UIButton = UIButton()
    let devidButton: UIButton = UIButton()
    
    let oneButton: UIButton = UIButton()
    let twoButton: UIButton = UIButton()
    let threeButton: UIButton = UIButton()
    let multipleButton: UIButton = UIButton()
    
    let fourButton: UIButton = UIButton()
    let fiveButton: UIButton = UIButton()
    let sixButton: UIButton = UIButton()
    let minuseButton: UIButton = UIButton()
    
    let sevenButton: UIButton = UIButton()
    let eightButton: UIButton = UIButton()
    let nineButton: UIButton = UIButton()
    let plusButton: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //for문을 사용해서 함수 적용하기
        let buttons: [(UIButton, String, UIColor)] = [
            (acButton, "AC", .orange),
            (zeroButton, "0", .customGray),
            (devidButton, "/", .orange),
            
            (oneButton, "1", .customGray),
            (twoButton, "2", .customGray),
            (threeButton, "3", .customGray),
            (multipleButton, "*", .orange),
            
            (fourButton, "4", .customGray),
            (fiveButton, "5", .customGray),
            (sixButton, "6", .customGray),
            (minuseButton, "-", .orange),
            
            (sevenButton, "7", .customGray),
            (eightButton, "8", .customGray),
            (nineButton, "9", .customGray),
            (plusButton, "+", .orange)
        ]
        
        for (button, title, backgroundColor) in buttons {
            basicButtonUI(button, title, #selector(buttonTapped), backgroundColor)
        }
        //buttonTapped와 중복 적용을 막기 위해 for문에서 따로 빼둠
        basicButtonUI(equalButton, "=", #selector(equalTapped), .orange)
        
        screenNumberUI()
        //HorizontalStackView 적용
        let HorizontalStackView1 = makeHorizontalStackView([sevenButton, eightButton, nineButton, plusButton])
        let HorizontalStackView2 = makeHorizontalStackView([fourButton, fiveButton, sixButton, minuseButton])
        let HorizontalStackView3 = makeHorizontalStackView([oneButton, twoButton, threeButton, multipleButton])
        let HorizontalStackView4 = makeHorizontalStackView([acButton, zeroButton, equalButton, devidButton])
        //VerticalStackView 적용
        makeVerticalStackView([HorizontalStackView1, HorizontalStackView2, HorizontalStackView3, HorizontalStackView4])
    }
    // 코드 가독성을 위해 VerticalStackView도 함수로 만들어서 정리
    private func makeVerticalStackView(_ views: [UIView]) -> UIStackView {
        
        let verticalStackView = UIStackView(arrangedSubviews: views)
        
        verticalStackView.axis = .vertical
        verticalStackView.backgroundColor = .black
        verticalStackView.spacing = 10
        verticalStackView.distribution = .fillEqually
        
        view.addSubview(verticalStackView)
        
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo:label.bottomAnchor, constant: 60),
            verticalStackView.widthAnchor.constraint(equalToConstant: 350),
            verticalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        return verticalStackView
    }
    
    private func makeHorizontalStackView(_ buttons: [UIButton]) -> UIStackView {
        
        let horizontalStackView = UIStackView(arrangedSubviews: buttons)
        
        horizontalStackView.axis = .horizontal
        horizontalStackView.backgroundColor = .black
        horizontalStackView.spacing = 10
        horizontalStackView.distribution = .fillEqually
        
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            horizontalStackView.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        return horizontalStackView
    }
    
    private func screenNumberUI() {
        view.backgroundColor = .black
        label.text = "0"
        label.textColor = .white
        label.font = .systemFont(ofSize: 60, weight: .bold)
        label.textAlignment = .right
        //예외처리1: 기존에 숫자가 프레임을 넘어가면 ...처리되던 걸 기본 아이폰 계산기 처럼 무한으로 눌릴 수 있게 처리
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.1
        label.lineBreakMode = .byClipping
        
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            label.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func basicButtonUI(_ button: UIButton, _ title: String, _ action: Selector, _ backgroundColor: UIColor) {
        button.setTitle(title, for: .normal)
        button.addTarget(self, action: action, for: .touchUpInside)
        button.titleLabel?.textColor = .white
        button.backgroundColor = backgroundColor
        button.titleLabel?.font = .systemFont(ofSize: 30)
        button.layer.cornerRadius = 40
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 80),
            button.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
    //버튼을 누르면 해당 버튼의 텍스트가 라벨에 보이도록 하는 함수
    @objc private func buttonTapped(_ sender: UIButton) {
        guard let buttonTitle = sender.title(for: .normal) else { return }
        
        if label.text == "0" {
            label.text = buttonTitle
        } else if buttonTitle == "AC" {
            label.text = "0"
        } else {
            label.text = (label.text ?? "") + buttonTitle
        }
        //예외처리2: 계산식 뒤에는 0이 올 수 없도록 처리
        if ["+0", "-0", "*0", "/0"].contains(label.text!.suffix(2)) {
            label.text!.removeLast()
        }
    }
    //제공된 계산 함수를 적용하기 위한 equalTapped함수
    @objc private func equalTapped() {
        guard let expression = label.text else { return }
        if let result = calculate(expression: expression) {
            label.text = "\(result)"
        } else {
            label.text = "Error"
        }
    }
    //제공된 계산 함수
    func calculate(expression: String) -> Int? {
        let expression = NSExpression(format: expression)
        if let result = expression.expressionValue(with: nil, context: nil) as? Int {
            return result
        } else {
            return nil
        }
    }
}

#Preview {
    ViewController()}
