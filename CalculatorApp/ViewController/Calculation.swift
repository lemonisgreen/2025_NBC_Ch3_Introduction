//
//  Calculation.swift
//  CalculatorApp
//
//  Created by 최규현 on 3/26/25.
//
import Foundation

extension ViewController {
    
    enum ButtonTapped: String {
        case number0 = "0"
        case number1 = "1"
        case number2 = "2"
        case number3 = "3"
        case number4 = "4"
        case number5 = "5"
        case number6 = "6"
        case number7 = "7"
        case number8 = "8"
        case number9 = "9"
        case operAdd = "+"
        case operSub = "-"
        case operMul = "×"
        case operDiv = "/"
        case operEqual = "="
        case ac = "AC"
    }
    
    // Eqaul 버튼 클릭 시 실행될 예외처리 및 계산 작업
    func calculate(expression: String) throws -> Int {
        
        // 마지막 글자가 연산자면 throw
        guard !textValue.lastIsOperator else { throw CalculatorError.lastIsOperator }
        
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
    
    // 버튼 클릭 시 실행될 메서드
    func addNumber(_ number: String) {
        switch ButtonTapped(rawValue: number) {
        case .number0:                                  // 숫자0 버튼
            guard textValue != "0" else {
                numLabel.text = textValue
                return
            }
            guard !(textValue.count > 1 && textValue.last == "0" &&
                   textValue.beforeLastIsOperator) else {
                numLabel.text = textValue
                return
            }
            
            textValue += "0"
            numLabel.text = textValue
            
            
            // 숫자 버튼
        case .number1, .number2, .number3, .number4, .number5, .number6, .number7, .number8, .number9:
            if textValue == "0" {       // 아무것도 없는 상태
                textValue = number
                numLabel.text = textValue
                
            } else if textValue.count > 1 && textValue.last == "0" &&
                        textValue.beforeLastIsOperator {    // 연산자 뒤에 0이 있을 경우
                textValue.removeLast()
                textValue += number
                numLabel.text = textValue
                
            } else {                    // 일반
                textValue += number
                numLabel.text = textValue
            }
            
        case .ac:                                       // AC 버튼
            textValue = "0"
            numLabel.text = textValue
            
        case .operAdd, .operSub, .operMul, .operDiv:    // 연산자 버튼
            if textValue.last != "+" &&
            textValue.last != "-" &&
            textValue.last != "×" &&
            textValue.last != "/" {
                textValue += number
                numLabel.text = textValue
            }
            
        case .operEqual:    // Equal 버튼
            do {            // "="버튼을 눌렀을 때 예외처리
                
                textValue = try String(calculate(expression: textValue))
                numLabel.text = textValue
                
            } catch CalculatorError.lastIsOperator {    // 식의 마지막 문자가 연산자일 때
                textValue = "0"
                numLabel.text = "Error"
            } catch CalculatorError.failCalculation {   // 계산에 실패한 경우
                textValue = "0"
                numLabel.text = "Error"
            } catch {
                textValue = "0"
                numLabel.text = "Unknown Error"
            }
            
        default:
            return
        }
    }
    
    // 파악 가능한 에러
    enum CalculatorError: Error {
        case lastIsOperator
        case failCalculation
    }
    
}

extension String {
    var lastIsOperator: Bool {
        return self[self.index(before: self.endIndex)] == "+" ||
        self[self.index(before: self.endIndex)] == "-" ||
        self[self.index(before: self.endIndex)] == "×" ||
        self[self.index(before: self.endIndex)] == "/"
    }
    var beforeLastIsOperator: Bool {
        return self[self.index(before: self.index(before: self.endIndex))] == "+" ||
        self[self.index(before: self.index(before: self.endIndex))] == "-" ||
        self[self.index(before: self.index(before: self.endIndex))] == "×" ||
        self[self.index(before: self.index(before: self.endIndex))] == "/"
    }
}
