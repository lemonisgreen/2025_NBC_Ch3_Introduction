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
        
        basicButtonUI(acButton, title: "AC")
        basicButtonUI(zeroButton, title: "0")
        basicButtonUI(equalButton, title: "=")
        basicButtonUI(devidButton, title: "/")
        
        basicButtonUI(oneButton, title: "1")
        basicButtonUI(twoButton, title: "2")
        basicButtonUI(threeButton, title: "3")
        basicButtonUI(multipleButton, title: "*")
        
        basicButtonUI(fourButton, title: "4")
        basicButtonUI(fiveButton, title: "5")
        basicButtonUI(sixButton, title: "6")
        basicButtonUI(minuseButton, title: "-")
        
        basicButtonUI(sevenButton, title: "7")
        basicButtonUI(eightButton, title: "8")
        basicButtonUI(nineButton, title: "9")
        basicButtonUI(plusButton, title: "+")
        
        screenNumberUI()
     
        let HorizontalStackView1 = makeHorizontalStackView([sevenButton, eightButton, nineButton, plusButton])
        let HorizontalStackView2 = makeHorizontalStackView([fourButton, fiveButton, sixButton, minuseButton])
        let HorizontalStackView3 = makeHorizontalStackView([oneButton, twoButton, threeButton, multipleButton])
        let HorizontalStackView4 = makeHorizontalStackView([acButton, zeroButton, equalButton, devidButton])
        
    }
    
   private func makeHorizontalStackView(_ buttons: [UIButton]) -> UIStackView {
        
        let stackView = UIStackView(arrangedSubviews: buttons)
        
        stackView.axis = .horizontal
        stackView.backgroundColor = .black
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        return stackView
    }
    
    private func screenNumberUI() {
        view.backgroundColor = .black
        label.text = "12345"
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
    
    private func basicButtonUI(_ button: UIButton, title: String) {
        button.setTitle(title, for: .normal)
        button.titleLabel?.textColor = .white
        button.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
        button.titleLabel?.font = .systemFont(ofSize: 30)
        button.layer.cornerRadius = 40
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 80),
            button.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
}

#Preview {
    ViewController()}
