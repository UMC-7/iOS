//
//  ViewController.swift
//  Practice_3rd
//
//  Created by 윤시진 on 10/8/24.
//

import UIKit

class UserDefaultsViewController: UIViewController {

//    private let userDefaultsModel = UserDefaultsModel()  // Model을 참조
//    private lazy var userDefaultsView: UserDefaultsView = {
//        let view = UserDefaultsView()
//        return view
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.view = userDefaultsView  // View 설정
//
//        view.backgroundColor = .white
//        
//        // 기존 저장된 값을 출력
//        updateOutputLabel()
//
//        // 저장 버튼 액션 설정
//        userDefaultsView.saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
//    }
//
//    // 저장 버튼 눌렸을 때 처리
//    @objc private func saveButtonTapped() {
//        guard let text = userDefaultsView.textField.text, !text.isEmpty else { return }
//        userDefaultsModel.saveText(text)  // Model에 저장
//        updateOutputLabel()  // 저장 후 출력 라벨 업데이트
//    }
//
//    // 저장된 값을 출력하는 함수
//    private func updateOutputLabel() {
//        if let savedText = userDefaultsModel.loadText() {
//            userDefaultsView.outputLabel.text = savedText
//        } else {
//            userDefaultsView.outputLabel.text = "UserDefaults 값이 출력됩니다."
//        }
//    }
    
    private let userDefaultsModel = UserDefaultsModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = userDefaultsview
        loadTextValue()
    }
    
    private lazy var userDefaultsview: UserDefaultsView = {
        let view = UserDefaultsView()
        view.saveButton.addTarget(self, action: #selector(saveButtonClicked), for: .touchUpInside)
        return view
    }()
    
    @objc func saveButtonClicked() {
        guard let text = userDefaultsview.inputTextField.text, !text.isEmpty else {
            return
        }
        
        // 모델을 통해 텍스트 저장합니다.
        userDefaultsModel.saveUserText(text)
        
        // 저장된 텍스트 라벨에 표시
        userDefaultsview.showTextValue.text = text
    }
    
    // 저장된 텍스트 값이 있을 경우 가져오기
    private func loadTextValue() {
        if let savedText = userDefaultsModel.loadUserText() {
            userDefaultsview.showTextValue.text = savedText
        }
    }
}
