//
//  ViewController.swift
//  Codebase-Calculator
//
//  Created by NH on 4/1/25.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        configureUI()
    }
    
    func configureUI() {
        label.text = "Hello World"
        label.textColor = .white
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20)
        
        view.addSubview(label)
        
        label.snp.makeConstraints {
            $0.width.height.equalTo(200)
            $0.center.equalToSuperview()
        }
    }


}

