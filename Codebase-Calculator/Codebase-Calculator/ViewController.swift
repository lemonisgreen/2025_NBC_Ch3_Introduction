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
    let stackView = UIStackView() // 스택 뷰
    let button7 = UIButton()
    let button8 = UIButton()
    let button9 = UIButton()
    let buttonPlus = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    func configureUI() {
        view.backgroundColor = .black
        
        // 라벨 속성 정의
        label.text = "12345"
        label.textColor = .white
        label.textAlignment = .right
        label.font = .boldSystemFont(ofSize: 60)
        
        // 7 버튼 속성 정의
        button7.setTitle("7", for: .normal)
        button7.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button7.backgroundColor = UIColor(red: 58/255,
                                          green: 58/255,
                                          blue: 58/255,
                                          alpha: 1.0)
        button7.layer.cornerRadius = 40
        
        // 8 버튼 속성 정의
        button8.setTitle("8", for: .normal)
        button8.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button8.backgroundColor = UIColor(red: 58/255,
                                          green: 58/255,
                                          blue: 58/255,
                                          alpha: 1.0)
        button8.layer.cornerRadius = 40
        
        // 9 버튼 속성 정의
        button9.setTitle("9", for: .normal)
        button9.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button9.backgroundColor = UIColor(red: 58/255,
                                          green: 58/255,
                                          blue: 58/255,
                                          alpha: 1.0)
        button9.layer.cornerRadius = 40
        
        // + 버튼 속성 정의
        buttonPlus.setTitle("+", for: .normal)
        buttonPlus.titleLabel?.font = .boldSystemFont(ofSize: 30)
        buttonPlus.backgroundColor = UIColor(red: 58/255,
                                          green: 58/255,
                                          blue: 58/255,
                                          alpha: 1.0)
        buttonPlus.layer.cornerRadius = 40
        
        
        // 스택뷰 속성 정의
        stackView.axis = .horizontal
        stackView.backgroundColor = .black
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        
        
        [button7, button8, button9, buttonPlus]
            .forEach{ stackView.addArrangedSubview($0) }
        
        
        [label, stackView]
            .forEach{ view.addSubview($0) }
        
        label.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().inset(30)
            $0.top.equalToSuperview().offset(200)
            $0.height.equalTo(100)
        }
        
        button7.snp.makeConstraints {
            $0.width.height.equalTo(80)
        }
        
        button8.snp.makeConstraints {
            $0.width.height.equalTo(80)
        }
        
        button9.snp.makeConstraints {
            $0.width.height.equalTo(80)
        }
        
        buttonPlus.snp.makeConstraints {
            $0.width.height.equalTo(80)
        }
        
        stackView.snp.makeConstraints {
            $0.height.equalTo(80)
            $0.top.equalTo(label.snp.bottom).offset(30)
            $0.centerX.equalTo(label.snp.centerX)
        }
    }
}

