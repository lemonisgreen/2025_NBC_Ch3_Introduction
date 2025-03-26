# 2025_NBC_Ch3_Introduction
Ch 3. 앱 개발 입문 주차 과제: 계산기 앱 만들기

---



# 📱 CalculatorApp

CalculatorApp은 iPhone의 기본 앱인 계산기 앱을 모방해 만든 앱입니다.

---

## 📋 프로젝트 개요

숫자 버튼을 클릭해 상단에 숫자를 입력하고 연산자를 활용해 다양한 계산이 가능합니다.

---

## ⏰ 프로젝트 일정

- **시작일**: 25/03/24  
- **종료일**: 25/04/04

---

## 📱 주요 기능

1. **버튼 터치**  
  버튼들을 활용해 숫자와 연산자의 입력이 가능합니다. 

2. **연산**  
  (=) 버튼을 클릭해 지금까지 입력한 문자들의 계산이 가능합니다. 

3. **초기화**  
  AC 버튼을 터치하면 모든 게 초기화되고 다시 0이 출력됩니다. 


---

## ℹ️ 기능 구현 방식

- StackView를 사용해서 UI를 깔끔하게 배치
- do - catch문을 사용해 안전한 예외처리 구현
- SnapKit 사용으로 UI를 세팅하는 메서드의 가독성 증가

---

## 🔫 Trouble Shooting


### 👿 Trouble

우선 모양만 만들자 싶어서 글 안 읽고 코드베이스로 UI 다 짜놨는데 막상 글 읽고 나니 수정할 부분이 꽤 많다.

(가이드에서 UILabel, UIButton, UIStackView를 활용하라길래 뒷부분 안 읽고 그냥 진행함)

.

.

.

### 🔫 Shooting

**-> 오토레이아웃 부분 싹 지우고 속성부터 부족한 부분 채워가며 다시 작성**


----------

### 👿 Trouble

func makeHorizontalStackView(_ views: [UIView]) -> UIStackView {}

같은 형태로 메서드를 만들어두면 좋다고 한다.

  

-> 대충 StackView 속성을 여러 개 처리해야 하니까 필요한 메서드인 건 알겠는데

저게 무슨 말이지; 반환값이 UIStackView인데 UIView의 배열을 입력받는다는 게 저게 무슨 말인지 모르겠다.

.

.

.

### 🔫 Shooting

한 30분정도 붙잡고 뭐 아무거나 넣어보고 하다가 결국 포기하고

지피티한테 ⬇️처럼 물어봤다.

  

> (지금까지 작성한 전체 코드)  
> 여기서 func makeHorizontalStackView(_ views: [UIView]) -> UIStackView {}를 만들라는데 이건 어떻게 쓰는 거야?

  

**-> 메서드 안에 StackView의 속성들을 정의해두고  사용할 버튼들을 입력값으로 주면 완성된 StackView를 출력한다고 한다.**

.

.

.

### 🧐 Question

매개변수로 버튼을 입력받을 건데 왜 UIView라고 적어둔 거지?

.

.

.

### 🙌 Answer

**-> 유연성을 확보하기 위함**

매개변수를 [UIButton]으로 제한하면 확장성이 떨어진다.

UIButton은 UIView를 상속받는 하위 클래스이기 때문에

[UIView]타입 배열에도 문제 없이 사용 가능하고

지금 프로젝트에서는 버튼만 사용하지만

나중에 다른 UI도 들어가야 하는 추가 사항이 있을 때까지 생각하면

[UIView]로 하는 것이 더 유연하고 효과적이라고 한다.


----------

### 👿 Trouble

첫 글자가 0이면 숫자를 입력할 때 0을 빼고 숫자가 들어가게는 했다.

근데 부호 뒤에 있는 숫자는? (예: 123+012 이런 식으로 나오는 건?)

.

.

.

### 🔫 Shooting

-> 라벨에 출력될 변수와 별도로 변수를 하나 더 만들어서

값을 같이 저장하다가 연산자를 눌렀을 때 숫자로 변환했다가 다시 문자로 변환해서

자동으로 맨 앞 0이 사라지게 하고 라벨에 출력될 변수에 저장하기?

- X : 실시간으로 변경되진 않겠네.

  

**->  현재 마지막 글자가 연산자인지 확인하는 메서드를 만들어서 0을 누를 때마다 작동하게 만들기.**


---

## 🎄 파일 구조

```
.
├── CalculatorApp
│   ├── AppDelegate.swift
│   ├── Assets.xcassets
│   │   ├── AccentColor.colorset
│   │   │   └── Contents.json
│   │   ├── AppIcon.appiconset
│   │   │   └── Contents.json
│   │   └── Contents.json
│   ├── Base.lproj
│   │   └── LaunchScreen.storyboard
│   ├── Calculation.swift
│   ├── Info.plist
│   ├── SceneDelegate.swift
│   ├── SetUpUI.swift
│   └── ViewController.swift
├── CalculatorApp.xcodeproj
│   ├── project.pbxproj
│   ├── project.xcworkspace
│   │   ├── contents.xcworkspacedata
│   │   ├── xcshareddata
│   │   │   └── swiftpm
│   │   │       ├── Package.resolved
│   │   │       └── configuration
│   │   └── xcuserdata
│   │       └── choegyuhyeon.xcuserdatad
│   │           └── UserInterfaceState.xcuserstate
│   └── xcuserdata
│       └── choegyuhyeon.xcuserdatad
│           └── xcschemes
│               └── xcschememanagement.plist
└── README.md
```
