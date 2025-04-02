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
        
        basicButtonUI(acButton, "AC", #selector(buttonTapped), .orange)
        basicButtonUI(zeroButton, "0", #selector(buttonTapped), .customGray)
        basicButtonUI(equalButton, "=", #selector(buttonTapped), .orange)
        basicButtonUI(devidButton, "/", #selector(buttonTapped), .orange)
        
        basicButtonUI(oneButton, "1", #selector(buttonTapped), .customGray)
        basicButtonUI(twoButton, "2", #selector(buttonTapped), .customGray)
        basicButtonUI(threeButton, "3", #selector(buttonTapped), .customGray)
        basicButtonUI(multipleButton, "*", #selector(buttonTapped), .orange)
        
        basicButtonUI(fourButton, "4", #selector(buttonTapped), .customGray)
        basicButtonUI(fiveButton, "5", #selector(buttonTapped), .customGray)
        basicButtonUI(sixButton, "6", #selector(buttonTapped), .customGray)
        basicButtonUI(minuseButton, "-", #selector(buttonTapped), .orange)
        
        basicButtonUI(sevenButton, "7", #selector(buttonTapped), .customGray)
        basicButtonUI(eightButton, "8", #selector(buttonTapped), .customGray)
        basicButtonUI(nineButton, "9", #selector(buttonTapped), .customGray)
        basicButtonUI(plusButton, "+", #selector(buttonTapped), .orange)
        
        screenNumberUI()
        
        let HorizontalStackView1 = makeHorizontalStackView([sevenButton, eightButton, nineButton, plusButton])
        let HorizontalStackView2 = makeHorizontalStackView([fourButton, fiveButton, sixButton, minuseButton])
        let HorizontalStackView3 = makeHorizontalStackView([oneButton, twoButton, threeButton, multipleButton])
        let HorizontalStackView4 = makeHorizontalStackView([acButton, zeroButton, equalButton, devidButton])
        
        makeVerticalStackView([HorizontalStackView1, HorizontalStackView2, HorizontalStackView3, HorizontalStackView4])
    }
    
    private func makeVerticalStackView(_ views: [UIView]) -> UIStackView {
        
        let verticalStackView = UIStackView(arrangedSubviews: views)
        
        verticalStackView.axis = .vertical
        verticalStackView.backgroundColor = .black
        verticalStackView.spacing = 10
        verticalStackView.distribution = .fillEqually
        verticalStackView.isUserInteractionEnabled = true
        
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
    
    @objc private func buttonTapped(_ sender: UIButton) {
        guard let buttonTitle = sender.title(for: .normal) else { return }
        
        if label.text == "0" {
            label.text = buttonTitle
        } else if buttonTitle == "AC" {
            label.text = "0"
        } else {
            label.text = (label.text ?? "") + buttonTitle
        }
    }
    
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
