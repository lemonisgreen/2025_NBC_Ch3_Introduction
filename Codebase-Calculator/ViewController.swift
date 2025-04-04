import UIKit
import SnapKit

class ViewController: UIViewController {
    // - MARK: - 라벨 속성 정의
    let label: UILabel = {
        let label = UILabel()
        
        label.text = "0" // 기본 텍스트 지정
        label.textColor = .white // 글자색 지정
        label.textAlignment = .right // 글자 정렬 기준 지정
        label.font = .boldSystemFont(ofSize: 60) // 글자 스타일 지정
        label.adjustsFontSizeToFitWidth = true // 라벨 크기에 따라 글자 크기 조정
        label.minimumScaleFactor = 0.2 // 글자 크기 줄어드는 최소 비율
        
        return label
    }()
    
    let calculateModel = Calculate() // 연산 기능 담당 클래스 객체 생성
}

// 뷰 사이클 분리
extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        setupLabel()
        setupStackView()
    }
}

private extension ViewController{
    func configureUI() {
        view.backgroundColor = .black // 배경색 검은색 지정
    }
    
    // 라벨 설정 메소드
    func setupLabel() {
        view.addSubview(label) // 뷰 위에 라벨 추가
        
        // 라벨 제약 조건 추가
        label.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().inset(30)
            $0.top.equalToSuperview().offset(200)
            $0.height.equalTo(100)
        }
    }
    // - MARK: - 스택뷰 정의 메소드
    /**
     스택뷰 정의 메소드
     */
    func setupStackView() {
        // 스택뷰 생성 메소드를 이용하여 스택뷰 생성
        let stackView = makeHorizontalStackView(buttonTitle: ["7", "8", "9", "+"])
        let secondStackView = makeHorizontalStackView(buttonTitle: ["4", "5", "6", "-"])
        let thirdStackView = makeHorizontalStackView(buttonTitle: ["1", "2", "3", "*"])
        let fourthStackView = makeHorizontalStackView(buttonTitle: ["AC", "0", "=", "/"])
        
        let verticalStackView = makeVerticalStackView()
        
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
    // - MARK: - 수직 스택뷰 생성 메소드
    /**
     수직 스택뷰 생성 메소드
     
     - Returns: 생성한 스택뷰
     */
    func makeVerticalStackView() -> UIStackView {
        // - MARK: - 수직 스택뷰 속성 정의
        let verticalStackView = UIStackView()
        
        verticalStackView.axis = .vertical
        verticalStackView.backgroundColor = .black
        verticalStackView.spacing = 10
        verticalStackView.distribution = .fillEqually
        
        return verticalStackView
    }
        
    // - MARK: - 버튼 생성 메소드
    /**
     버튼 생성 메소드
     
     - Parameters:
     - title: 생성할 버든의 이름 설정
     - Returns : 생성한 버튼
     */
    func makeButton(title: String) -> UIButton {
        let button = UIButton() // 버튼 객체 생성
        
        /*
         버튼 이름이 특정 문자와 일치하면
         버튼 색을 오랜지 색으로 변경한다.
         */
        let orange = ["+", "-", "*", "/", "AC", "="] // 오렌지 색 버튼으로 만들 문자 배열
        
        // 버튼 제목이 오렌지 배열에 포함되면 색을 오렌지 색으로, 아니면 회식으로 설정
        if orange.contains(title) {
            button.backgroundColor = .orange
        } else {
            button.backgroundColor = UIColor(
                red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0
            )
        }
        
        button.setTitle(title, for: .normal) // 버튼 제목 설정
        button.titleLabel?.font = .boldSystemFont(ofSize: 30) // 버튼 제목 스타일 및 크기 설정
        
        /*
         버튼의 가로 길이 구하기
         - 수직 스택뷰 너비: 350,
         - 수직 스택뷰 spacing: 10 * 3 (수평 스택뷰가 4개가 있으므로)
         총 너비인 350에서 spacing 값을 빼고 버튼 개수인 4로 나누면 버튼의 너비가 된다.
         따라서 (350 - 10 * 3) / 4 = 80 이된다.
         
         원형 버튼은 conrRadius의 값을 너비의 절반 값으로 설정하면 된다.
         버튼의 너비가 80 이므로 40을 주면 원형 버튼이 된다.
         */
        button.layer.cornerRadius = 40
        button.addTarget(self, action: #selector(buttonTapped), for: .touchDown) // 버튼 액션 설정
        
        // 버튼 제약 설정
        button.snp.makeConstraints { $0.width.height.equalTo(80)}
        
        return button
    }
    
    // - MARK: - 수평 스택뷰 생성 메소드
    /**
     버튼을 담고있는 스택뷰 생성 메소드
     
     - Parameters:
        - buttonTitle: 스택뷰에 넣을 버튼 이름의 배열
     - Returns: 생성한 스택뷰
     */
    func makeHorizontalStackView(buttonTitle : [String]) -> UIStackView {
        let buttons = buttonTitle.map { makeButton(title: $0) } // makeButton 메소드를 이용하여 버튼 생성
        let stackView = UIStackView(arrangedSubviews: buttons) // 스택뷰에 윗줄에서 만들 버튼 객체 삽입
        
        stackView.axis = .horizontal // 스택뷰에 수평 속성 추가
        stackView.spacing = 10 // 스택뷰 요소 간격 설정
        stackView.distribution = .fillEqually // 스택뷰 요소 분산 설정
        
        stackView.snp.makeConstraints {
            $0.height.equalTo(80)
        }
        
        return stackView
    }
    // - MARK: - 버튼 이벤트 메소드
    /**
     버튼 이벤트 생성 메소드

     - Parameters:
        - button: 이벤트 연결할 버튼 객체
     */
    @objc
    private func buttonTapped(button: UIButton) {
        /*
         최근에 눌린 버튼의 이름을 가저오는 변수
         currentTitle 사용하면 최근 사용된 버튼의 title을 가져옴
         
         옵셔널을 언래핑을 위해 guard let 사용
         */
        guard let tappedButtonTitle = button.currentTitle else { return }
        guard let lastText = label.text?.last else { return }
        
        // 누른 버튼에 따른 로직 구현
        switch tappedButtonTitle {
        case "AC":
            label.text = "0"
            return
        case "=":
            // 예외처리: 계산식이 연산자에서 끝났으면 아무동작 하지 않게 처리
            if ["/", "*", "-", "+"].contains(lastText) {
                return
            } else {
                let result = calculateModel.calculate(expression:label.text!) // 연산 수행
                label.text = String(result!) // 결과 출력
            }
        case "0":
            // 예외처리: "0" 만 있을 때 "0"을 추가 할 수 없게 처리
            if label.text == "0" {
                return
            } else {
                label.text! += tappedButtonTitle // 예외처리 상황이 아니면 계산식에 "0" 추가
            }
        case "/","*","-","+":
            // 예외처리: 마지막 계산식에 연산자가 있으면, 더 이상 연산자를 사용 못하게 처리
            if ["/", "*", "-", "+"].contains(lastText) {
                // 연사자 입력 후 다시 연산자를 입력하면 마지막 입력한 연산자로 변경됨
                // 예) 12+ 입력 후 - 입력 시 12- 로 변경됨
                label.text!.removeLast()
                label.text! += tappedButtonTitle
                return
            }
            
            // 예외처리: 첫 계산식이 0과 연산자가 될 수 없게 처리
            if ["/", "*", "-", "+", "0"].contains(label.text) {
                return
            } else {
                label.text! += tappedButtonTitle // 예외처리 상황이 아니면 계산식에 추가
            }
        default:
            // 연산자 뒤에 "0"일때 "0"을 지우고 숫자 추가하기
            if ["+0", "-0", "*0", "/0"].contains(label.text!.suffix(2)) {
                label.text!.removeLast()
            }
            // 예외처리: 첫 계산식이 0이 될 수 없게 처리
            if label.text == "0" {
                label.text! = tappedButtonTitle // "0" 을 없애고 숫자를 추가
            } else {
                label.text! += tappedButtonTitle // 예외처리 상황이 아니면 계산식에 추가
            }
        }
    }
}

#Preview { ViewController() }
