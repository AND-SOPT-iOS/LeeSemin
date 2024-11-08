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
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.textColor = .label
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let hobbyTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Hobby"
        textField.textColor = .label
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("유저 등록하기", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.layer.borderColor = UIColor(red: 0.678, green: 0.847, blue: 1.0, alpha: 1.0).cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        return button
    }()
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.text = "모든 항목을 8자 이하로 입력해주세요."
        return label
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인 바로가기", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.layer.borderColor = UIColor(red: 0.6, green: 0.8, blue: 0.6, alpha: 1.0).cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setUI()
        setLayout()
        setTargets()
    }
    
    private func setTargets() {
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    private func setStyle() {
        view.backgroundColor = .systemBackground
    }
    
    private func setUI() {
        view.addSubviews(userNameTextField, passwordTextField, hobbyTextField, signUpButton, resultLabel, loginButton)
    }
    
    private func setLayout() {
        userNameTextField.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(userNameTextField.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        hobbyTextField.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        signUpButton.snp.makeConstraints {
            $0.top.equalTo(hobbyTextField.snp.bottom).offset(30)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        resultLabel.snp.makeConstraints {
            $0.top.equalTo(signUpButton.snp.bottom).offset(40)
            $0.centerX.equalToSuperview()
        }
        
        loginButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(50)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
    }
    
    @objc func signUpButtonTapped() {
        UserService().signUp(
            username: userNameTextField.text!,
            password: passwordTextField.text!,
            hobby: hobbyTextField.text!
        ) { [weak self] result in
            dump(result)
            DispatchQueue.main.async {
                guard let self = self else { return }
                
                switch result {
                case .success:
                    self.resultLabel.text = "회원 등록에 성공했어요."
                case let .failure(error):
                    self.resultLabel.text = error.errorMessage
                }
            }
        }
    }
    
    @objc func loginButtonTapped() {
        let loginVC = LoginViewController()
        navigationController?.pushViewController(loginVC, animated: true)
    }
}
