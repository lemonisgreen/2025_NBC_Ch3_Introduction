# 코드베이스로 계산기 구현하기

> 내일배움캠프 Chatper 3 과제
> 코드베이스로 계산기 UI 및 기능을 구현하는 과제 입니다.
---

## 📋 프로젝트 개요

해당 프로젝트는 Swift 학습을 통한 개발능력 향상을 주 목표입니다.
Lv1 ~ Lv8 단계가 있습니다.
단계별로 필수로 요구되는 기능이 있습니다.

### 필수 구현 기능

** Level 1 **
🧑🏻‍💻 `UILabel` 을 사용해서 수식을 표시할 수 있는 라벨을 띄웁니다.

- **속성**
    - `backgroundColor = .black`
    - `textColor = .white`
    - 우선, 텍스트는 `12345` 로 고정
    - 텍스트 오른쪽 정렬
    - Font = 시스템 볼드체, 사이즈 60
- **AutoLayout**
    - leading, trailing = superView 로 부터 30 떨어지도록 세팅
    - top = superView 로 부터 200 떨어지도록 세팅
    - height = 100

** Level 2 **

🧑🏻‍💻 `UIStackView` 을 사용해서 4개의 버튼을 모아 가로 스택뷰 생성. 왼쪽과 같이 구성해보세요.

- **`UIButton` 속성**
    - `font = .boldSystemFont(ofSize: 30)`
    - `backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)`
    - `height = 80`
    - `width = 80`
    - `layer.cornerRadius = 40`
- **`horizontalStackView` 속성**
    - `axis = .horizontal`
    - `backgroundColor = .black`
    - `spacing = 10`
    - `distribution = .fillEqually`
- **`horizontalStackView AutoLayout`**
    - height = 80


** Level 3 **
🧑🏻‍💻 `UIStackView` 을 사용해서 세로 스택 뷰 생성. 왼쪽과 같이 구성해보세요.

- **`verticalStackView` 속성**
    - `axis = .vertical`
    - `backgroundColor = .black`
    - `spacing = 10`
    - `distribution = .fillEqually`
- **`verticalStackView AutoLayout`**
    - width = 350
    - top = label 의 bottom 으로 부터 60 떨어지도록.
    - centerX = superView 와 같도록.

** Level 4 **
🧑🏻‍💻 연산 버튼 (+, -, *, /, AC, =) 들은 색상을 orange 로 설정.

- **개발 효율성을 위한 팁.**
버튼을 만드는 `func makeButton` 이라는 메서드가 있었고 인자로 `titleValue: String`, `action: Selector`, `backgroundColor: UIColor` 를 받을 수 있으면 편했겠죠.

** Level 5 **
🧑🏻‍💻 모든 버튼들을 원형으로 만들기.

- **힌트**
    - HorizontalStackView 의 높이 = 80
    - VerticalStackView 의 가로 = 350.
    - VerticalStackView 의 Spacing = 10
    - 그렇기 때문에 VerticalStackView 에 들어가는 모든 버튼은 가로 길이가 (350 - 10 * 3) / 4 = 80 이 됨.
    - 즉 모든 버튼은 정사각형이 됨.
    - 버튼을 원형으로 만들기 위해서는 정사각형 버튼을 만들고, cornerRadius 를 한 변 길이의 절반으로 설정하면 됩니다.
    - 여기까지 했으면 필수 구현들을 마쳤습니다.
    - 기본적인 UI 구성이었습니다.
    - 이 다음 스텝들은 본격적인 로직의 영역입니다.
    

### 도전 구현 기능

** Level 6 **
🧑🏻‍💻 **버튼을 클릭하면 라벨에 표시되도록 합니다.**


- [ ]  이제 기본 텍스트는 “12345” 가 아닌 “0” 이 되도록 합니다.
- [ ]  기본으로 라벨에 노출되어있던 텍스트 오른쪽에 버튼을 클릭하면 그 버튼의 값이 추가되도록 합니다.
    - 예를들어 설명하면
        1. 맨처음 기본값 `0`
        2. 그 다음 `1` 클릭했음 → 표시되는 값은 `01`
        3. 그 다음 `2` 클릭했음 → 표시되는 값은 `02`
        4. 그 다음 `+` 클릭했음 → 표시되는 값은 `02+`
        5. 그 다음 `3` 클릭했음 → 표시되는 값은 `02+3`
- [ ]  하지만 `012` 라는 값은 이상합니다. 맨 앞자리가 `0` 인 숫자라면, 0을 지우고 표현하도록 합니다.
    - 예를들면, `012` → `12` 가 되어야 합니다.

** Level 7 **
🧑🏻‍💻 **초기화 버튼 (`AC`) 을 구현합니다.**


- [ ]  AC 버튼을 클릭하면 모든 값을 지우고 “0” 으로 초기화 되도록 구현합니다.

** Level 8 **
🧑🏻‍💻 **등호 (`=`) 버튼을 클릭하면 연산이 수행되도록 구현합니다.**

- `1+2+3` 을 입력 후, `=` 을 클릭하면 결과값인 `6` 이 출력되도록 해주세요.
- `123*456` 을 입력 후, `=` 을 클릭하면 결과값인 `56088` 이 출력되도록 해주세요.
- 연산에 필요한 메서드를 제공해드리겠습니다. 이 메서드를 활용해주세요.
    
    ```swift
    /// 수식 문자열을 넣으면 계산해주는 메서드.
    ///
    /// 예를 들어 expression 에 "1+2+3" 이 들어오면 6 을 리턴한다.
    /// 잘못된 형식의 수식을 넣으면 앱이 크래시 난다. ex) "1+2++"
    func calculate(expression: String) -> Int? {
            let expression = NSExpression(format: expression)
        if let result = expression.expressionValue(with: nil, context: nil) as? Int {
            return result
        } else {
            return nil
        }
    }
    ```
    주석의 설명대로, 잘못된 형식의 수식을 넣으면 동작하지 않습니다.
    예를들어 `1+2++` 라는 수식은 잘못된 수식입니다.

---

## ⏰ 프로젝트 일정

- **시작일**: 25/03/24
- **종료일**: 25/04/04

---

## 🛠️ 기술 스택
- **언어(Language)** : Swift

- **예외 처리(Exception Handling)**
  - `guard`와 `if let`을 활용
  
---

## 📱 주요 기능

- 기본적인 사칙연산 지원 (`+`, `-`, `*`, `/`)
- 연산자 중복 입력 방지
- 연산 결과 표시
- `AC` 버튼을 통한 초기화 기능

---

## 📦 설치 및 실행 방법

1. 이 저장소를 클론합니다:
   ```bash
   git clone https://github.com/mnh4140/sparta-bootcamp-iOS-Codebase-Calculator.git
2. Xcode에서 프로젝트를 엽니다.
3. 실행 버튼을 눌러 시뮬레이터에서 확인합니다.
