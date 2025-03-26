//
//  Calculation.swift
//  CalculatorApp
//
//  Created by 최규현 on 3/26/25.
//
import Foundation

extension ViewController {
    
    // Eqaul 버튼 클릭 시 실행될 예외처리 및 계산 작업
    func calculate(expression: String) throws -> Int {
        
        // 마지막 문자가 숫자가 아니라 연산자면 throw
        guard textValue.last != "+" &&
                textValue.last != "-" &&
                textValue.last != "×" &&
                textValue.last != "/"
        else { throw CalculatorError.lastIsOperator }
        
        // 현재 곱하기 연산자가 보기 좋게 ×로 되어 있어서 *로 변경해줘야 함
        let replaced = expression.replacingOccurrences(of: "×", with: "*")
        let expression = NSExpression(format: replaced)
        
        // 연산 작업에서 문제가 생기면 throw
        if let result = expression.expressionValue(with: nil, context: nil) as? Int {
            return result
        } else {
            throw CalculatorError.failCalculation
        }
    }
    
    // 연산자 추가 시 실행될 메서드
    func addOperator(_ input: String) {
        if textValue.last != "+" &&
        textValue.last != "-" &&
        textValue.last != "×" &&
        textValue.last != "/" {
            textValue += input
        }
        
        numLabel.text = textValue
    }
    
    // 0을 추가 시 실행될 메서드
    func addZero() {
        guard textValue != "0" else { return }
        
        if textValue.last != "+" &&
        textValue.last != "-" &&
        textValue.last != "×" &&
        textValue.last != "/" {
            textValue += "0"
        }
        
        numLabel.text = textValue
    }
    
    // 0을 제외한 숫자 추가 시 실행될 메서드
    func addNumber(_ number: String) {
        if textValue != "0" {
            textValue += number
        } else {
            textValue = number
        }
        
        numLabel.text = textValue
    }
    
    // 파악 가능한 에러
    enum CalculatorError: Error {
        case lastIsOperator
        case failCalculation
    }
    
}
