//
//  Calculate.swift
//  Codebase-Calculator
//
//  Created by NH on 4/1/25.
//
import UIKit

class Calculate {
    /**
     계산 수행하는 메소드
     
     - Parameters:
     - expression: 라벨의 수식
     - Returns:
     */
    func calculate(expression: String) -> Int? {
        let expression = NSExpression(format: expression) // 객체 생성
        
        // 표현식 평가, 실제로 계산식 실행
        if let result = expression.expressionValue(with: nil, context: nil) as? Int {
            return result // 계산 결과 반환
        } else {
            return nil // 틀린 수식은 반환 X
        }
    }
}
