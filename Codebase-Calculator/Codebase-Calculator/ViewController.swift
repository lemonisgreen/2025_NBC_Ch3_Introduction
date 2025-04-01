//
//  ViewController.swift
//  Codebase-Calculator
//
//  Created by NH on 4/1/25.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let label = UILabel() // 계산기 숫자 출력
    let verticalStackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    func configureUI() {
        view.backgroundColor = .black // 배경색 검은색 지정
        
        // 라벨 속성 정의
        label.text = "12345" // 기본 텍스트 지정
        label.textColor = .white // 글자색 지정
        label.textAlignment = .right // 글자 정렬 기준 지정
        label.font = .boldSystemFont(ofSize: 60) // 글자 스타일 지정
        
        view.addSubview(label) // 뷰 위에 라벨 추가
    
        // 라벨 제약 조건 추가
        label.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().inset(30)
            $0.top.equalToSuperview().offset(200)
            $0.height.equalTo(100)
        }
        
        // 스택뷰 생성 메소드를 이용하여 스택뷰 생성
        // 첫째 줄 스택뷰
        let stackView = makeHorizontalStackView(buttonTitle: ["7", "8", "9", "+"])
        
        // 첫째 줄 스택뷰 제약 조건 추가
        stackView.snp.makeConstraints {
            $0.height.equalTo(80)
        }
        
        // 둘째 줄 스택뷰
        let secondStackView = makeHorizontalStackView(buttonTitle: ["4", "5", "6", "-"])
        
        // 둘째 줄 스택뷰 제약 조건 추가
        secondStackView.snp.makeConstraints {
            $0.height.equalTo(80)
        }
        
        // 셋째 줄 스택뷰
        let thirdStackView = makeHorizontalStackView(buttonTitle: ["1", "2", "3", "*"])
        
        // 셋째 줄 스택뷰 제약 조건 추가
        thirdStackView.snp.makeConstraints {
            $0.height.equalTo(80)
        }
        
        // 네째 줄 스택뷰
        let fourthStackView = makeHorizontalStackView(buttonTitle: ["AC", "0", "=", "/"])
        
        // 네째 줄 스택뷰 제약 조건 추가
        fourthStackView.snp.makeConstraints {
            $0.height.equalTo(80)
        }
        
        
        // 수직 스택뷰 속성 정의
        verticalStackView.axis = .vertical
        verticalStackView.backgroundColor = .black
        verticalStackView.spacing = 10
        verticalStackView.distribution = .fillEqually
        
        view.addSubview(verticalStackView) // 뷰 위에 스택뷰 추가
        
        // 수직 스택뷰 제약 조건 추가
        verticalStackView.snp.makeConstraints {
            $0.width.equalTo(350)
            $0.top.equalTo(label.snp.bottom).offset(60)
            $0.centerX.equalTo(label.snp.centerX)
        }
        
        // 수직 스택뷰 안에 수평 스택뷰 4개 추가
        [stackView, secondStackView, thirdStackView, fourthStackView]
            .forEach { verticalStackView.addArrangedSubview($0) }
        
    }
    
    /**
     버튼 생성 메소드
     
     - Parameters:
        - title: 생성할 버든의 이름 설정
     - Returns : 생성한 버튼
     */
    func makeButton(title: String) -> UIButton {
        let button = UIButton()
        
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button.backgroundColor = UIColor(
            red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0
        )
        button.layer.cornerRadius = 40
        button.snp.makeConstraints { $0.width.height.equalTo(80)}
        return button
    }

    // - MARK: 스택뷰 생성 메소드
    /**
     버튼을 담고있는 스택뷰 생성 메소드
     
     - Parameters:
        - buttonTitle: 스택뷰에 넣을 버튼 이름의 배열
     - Returns: 생성한 스택뷰
     */
    func makeHorizontalStackView(buttonTitle : [String]) -> UIStackView {
        let buttons = buttonTitle.map { makeButton(title: $0) }
        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }
}
