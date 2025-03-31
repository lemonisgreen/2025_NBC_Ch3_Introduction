//
//  ViewController.swift
//  Calculator
//
//  Created by JIN LEE on 3/28/25.
//

import UIKit

class ViewController: UIViewController {
    
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        screenNumberUI()
        
    }
    
    private func screenNumberUI() {
        view.backgroundColor = .black
        label.text = "12345"
        label.textColor = .white
        
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.widthAnchor.constraint(equalToConstant: 300),
        ])
        
    }
  
    
    

}

