//
//  ViewController.swift
//  Codebase-Calculator
//
//  Created by NH on 4/1/25.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let label = UILabel() // 텍스트 출력

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    func configureUI() {
        view.backgroundColor = .black
        
        label.text = "12345"
        label.textColor = .white
        label.textAlignment = .right
        label.font = .boldSystemFont(ofSize: 60)
        
        view.addSubview(label)
        
        label.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().inset(30)
            $0.top.equalToSuperview().offset(200)
            $0.height.equalTo(100)
        }
    }
}

