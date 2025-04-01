//
//  ViewController.swift
//  Calculator
//
//  Created by JIN LEE on 3/28/25.
//

import UIKit

class ViewController: UIViewController {
    
    let label = UILabel()
    let sevenButton: UIButton = UIButton()
    let eightButton: UIButton = UIButton()
    let nineButton: UIButton = UIButton()
    let plusButton: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        screenNumberUI()
        sevenButtonUI()
        
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
    
    private func sevenButtonUI() {
        sevenButton.titleLabel?.text = "7"
        sevenButton.titleLabel?.textColor = .white
        sevenButton.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
        sevenButton.titleLabel?.font = .systemFont(ofSize: 30)
        sevenButton.layer.cornerRadius = 40
        
        view.addSubview(sevenButton)
        sevenButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sevenButton.heightAnchor.constraint(equalToConstant: 80),
            sevenButton.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
}
