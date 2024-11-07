//
//  SignUpViewController.swift
//  AND-SOPT-iOS
//
//  Created by 이세민 on 11/2/24.
//

import UIKit
import SnapKit

class SignUpViewController: UIViewController {
    
    private let userNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "User Name"
        textField.textColor = .label
        textField.borderStyle = .line
        return textField
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        return button
    }()
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.text = "8자 이하의 text를 입력해주세요."
        return label
    }()
    
    let userService = UserService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setUI()
        setLayout()
        setTargets()
    }
    
    private func setTargets() {
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
    }
    
    private func setStyle() {
        view.backgroundColor = .systemBackground
    }
    
    private func setUI() {
        view.addSubview(userNameTextField)
        view.addSubview(signUpButton)
        view.addSubview(resultLabel)
    }
    
    private func setLayout() {
        userNameTextField.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        signUpButton.snp.makeConstraints {
            $0.top.equalTo(userNameTextField.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(60)
        }
        
        resultLabel.snp.makeConstraints {
            $0.top.equalTo(signUpButton.snp.bottom).offset(40)
            $0.centerX.equalToSuperview()
        }
    }
    
    @objc func signUpButtonTapped() {
        userService.register(
            username: userNameTextField.text!,
            password: "123",
            hobby: "123"
        ) { [weak self] result in
            dump(result)
            DispatchQueue.main.async {
                guard let self = self else { return }
                
                var text: String
                switch result {
                case .success:
                    text = "회원 등록 성공했어요."
                case let .failure(error):
                    text = error.errorMessage
                }
                self.resultLabel.text = text
            }
        }
    }
}
