//
//  UserDefalutsView.swift
//  Practice_3rd
//
//  Created by 윤시진 on 10/8/24.
//

import UIKit

import SnapKit

class UserDefaultsView: UIView {

//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupLayout()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    // 타이틀 라벨
//    public let titleLabel: UILabel = {
//        let label = UILabel()
//        label.text = "UserDefaults 실습 뷰"
//        label.font = UIFont.systemFont(ofSize: 20)
//        label.textAlignment = .center
//        return label
//    }()
//    
//    // 텍스트 입력 필드
//    public let textField: UITextField = {
//        let textField = UITextField()
//        let placeholderText = "아무 텍스트나 입력해주세요"
//        
//        // placeholder 글씨 크기 조절
//        textField.attributedPlaceholder = NSAttributedString(
//            string: placeholderText,
//            attributes: [
//                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)
//            ]
//        )
//        textField.layer.cornerRadius = 10
//        textField.borderStyle = .line
//        textField.layer.borderColor = UIColor.black.cgColor
//        textField.layer.borderWidth = 2
//        textField.clipsToBounds = true
//        
//        let paddingView = UIView(frame: CGRect(x: 0, y: 15, width: 10, height: 52))
//            textField.leftView = paddingView
//            textField.leftViewMode = .always
//        return textField
//    }()
//
//    // 저장 버튼
//    public let saveButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.setTitle("UserDefaults에 저장하기", for: .normal)
//        button.setTitleColor(.red, for: .normal)
//        button.backgroundColor = .lightGray
//        button.layer.cornerRadius = 5
//        return button
//    }()
//
//    // 출력 타이틀 라벨
//    public let outputTitleLabel: UILabel = {
//        let label = UILabel()
//        label.text = "UserDefaults 값 출력 라벨"
//        label.font = UIFont.systemFont(ofSize: 20)
//        label.textAlignment = .center
//        return label
//    }()
//    
//    // 저장된 값 출력 라벨
//    public let outputLabel: UILabel = {
//        let label = UILabel()
//        label.text = "UserDefaults 값이 출력됩니다."
//        label.font = UIFont.systemFont(ofSize: 20)
//        label.textAlignment = .center
//        label.layer.borderColor = UIColor.blue.cgColor
//        label.layer.borderWidth = 1
//        label.layer.cornerRadius = 10
//        label.numberOfLines = 0
//        return label
//    }()
//
//
//
//    // 레이아웃 설정
//    private func setupLayout() {
//        addSubview(titleLabel)
//        addSubview(textField)
//        addSubview(saveButton)
//        addSubview(outputTitleLabel)
//        addSubview(outputLabel)
//
//        titleLabel.snp.makeConstraints { make in
//            make.top.equalToSuperview().offset(197)
//            make.centerX.equalToSuperview()
//        }
//
//        textField.snp.makeConstraints { make in
//            make.top.equalTo(titleLabel.snp.bottom).offset(26)
//            make.centerX.equalToSuperview()
//            make.width.equalTo(309)
//            make.height.equalTo(52)
//        }
//
//        saveButton.snp.makeConstraints { make in
//            make.top.equalTo(textField.snp.bottom).offset(26)
//            make.centerX.equalToSuperview()
//            make.width.equalTo(222)
//            make.height.equalTo(42)
//        }
//        
//        outputTitleLabel.snp.makeConstraints { make in
//            make.top.equalTo(saveButton.snp.bottom).offset(114)
//            make.centerX.equalToSuperview()
//            make.width.equalTo(280)
//            make.height.equalTo(24)
//        }
//        
//        outputLabel.snp.makeConstraints { make in
//            make.top.equalTo(saveButton.snp.bottom).offset(159)
//            make.centerX.equalToSuperview()
//            make.width.equalTo(280)
//            make.height.equalTo(127)
//        }
//    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setStackView()
        addViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 상단 컴포넌트들 구현
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "UserDefaults 실습 뷰"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = UIColor.black
        return label
    }()
    
    public lazy var inputTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "아무 텍스트나 입력해주세요"
        textField.textColor = UIColor.black
        textField.font = UIFont.systemFont(ofSize: 14)
        
        /* 텍스트 필드 placeholder 왼쪽 여백*/
        /* 피그마에서 텍스트필드 테두리와 placeholder 왼쪽 여백의 수치가 15이므로 width에 15를 넣습니다. */
        textField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 15.0, height: 0.0))
        textField.leftViewMode = .always
        
        /* 텍스트 필드 테두리 지정 */
        textField.borderStyle = .none
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 2
        textField.layer.cornerRadius = 10
        
        return textField
    }()
    
    public lazy var saveButton: UIButton = {
        let btn = UIButton()
        
        btn.setTitle("UserDefaults에 저장하기", for: .normal)
        btn.setTitleColor(UIColor.red, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        btn.backgroundColor = UIColor.gray
        
        return btn
    }()
    
    private lazy var topStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        /* 피그마를 참고해보면 그룹 내부의 여백이 26으로 동일합니다. */
        stackView.spacing = 26
        return stackView
    }()
    
    // MARK: - 하단 컴포넌트들 구현
    
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "UserDefaults 값 출력 라벨"
        label.textColor = UIColor.black
        label.textAlignment = .center
        return label
    }()
    
    public lazy var showTextValue: UILabel = {
        let label = UILabel()

        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "UserDefaults 값이 출력됩니다."
        label.textColor = UIColor.black
        label.textAlignment = .center
        
        label.layer.borderWidth = 3
        label.layer.borderColor = UIColor.blue.cgColor
        label.layer.cornerRadius = 10
        return label
    }()
    
    private lazy var bottomStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 21
        return stackView
    }()
    
    
    // MARK: - 상단, 하단 컴포넌트들 스택뷰 추가 및 스택뷰 오토레이아웃 지정
    
    private func setStackView() {
        topStackView.addArrangedSubview(titleLabel)
        topStackView.addArrangedSubview(inputTextField)
        topStackView.addArrangedSubview(saveButton)
        
        bottomStackView.addArrangedSubview(subTitleLabel)
        bottomStackView.addArrangedSubview(showTextValue)
    }
    
    private func addViewConstraints() {
        self.addSubview(topStackView)
        self.addSubview(bottomStackView)
        
        topStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(197)
            $0.left.equalToSuperview().offset(42)
            $0.right.equalToSuperview().offset(-42)
        }
        
        inputTextField.snp.makeConstraints {
            $0.height.equalTo(52)
            $0.width.equalTo(309)
        }
        
        saveButton.snp.makeConstraints {
            $0.height.equalTo(42)
            $0.width.equalTo(222)
        }
        
        bottomStackView.snp.makeConstraints {
            $0.top.equalTo(topStackView.snp.bottom).offset(114)
            $0.left.equalToSuperview().offset(56.5)
            $0.right.equalToSuperview().offset(-56.5)
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.width.equalTo(280)
            $0.height.equalTo(24)
        }
        
        showTextValue.snp.makeConstraints {
            $0.width.equalTo(280)
            $0.height.equalTo(172)
        }
    }
}
