import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let label = UILabel() // 계산기 숫자 출력
    let verticalStackView = UIStackView() // 수직 스택뷰

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    func configureUI() {
        view.backgroundColor = .black // 배경색 검은색 지정
        
        // - MARK: - 라벨 속성 정의
        label.text = "0" // 기본 텍스트 지정
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
        
        // - MARK: - 스택뷰 생성 메소드를 이용하여 스택뷰 생성
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
        
        
        // - MARK: - 수직 스택뷰 속성 정의
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
    
    // - MARK: - 버튼 생성 메소드
    /**
     버튼 생성 메소드
     
     - Parameters:
        - title: 생성할 버든의 이름 설정
     - Returns : 생성한 버튼
     */
    func makeButton(title: String) -> UIButton {
        let button = UIButton()
        
        /*
         버튼 이름이 특정 문자와 일치하면
         버튼 색을 오랜지 색으로 변경한다.
         */
        let orange = ["+", "-", "*", "/", "AC", "="]

        for i in orange {
            if title.contains(i) {
                button.backgroundColor = .orange
                break
            } else {
                button.backgroundColor = UIColor(
                    red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0
                )
            }
        }
        
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        
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
        button.addTarget(self, action: #selector(buttonTapped), for: .touchDown)
        
        button.snp.makeConstraints { $0.width.height.equalTo(80)}
        
        return button
    }

    // - MARK: - 스택뷰 생성 메소드
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
    
    @objc
    private func buttonTapped(button: UIButton) {
        /*
         최근에 눌린 버튼의 이름을 가저오는 변수
         currentTitle 사용하면 최근 사용된 버튼의 title을 가져옴
         
         옵셔널을 언래핑을 위해 guard let 사용
         */
        guard let tappedButtonTitle = button.currentTitle else { return }
        
        // 첫 글자가 0 이면 없애고, 아니면 글자만 추가
        if label.text == "0" {
            label.text = tappedButtonTitle
        } else {
            label.text! += tappedButtonTitle
        }
    }
}
