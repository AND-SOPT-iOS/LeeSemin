//
//  LoginViewController.swift
//  AND-SOPT-iOS
//
//  Created by 이세민 on 11/8/24.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
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
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.layer.borderColor = UIColor(red: 0.6, green: 0.8, blue: 0.6, alpha: 1.0).cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        return button
    }()
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.text = ""
        return label
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("유저 등록하러 가기", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.layer.borderColor = UIColor(red: 0.678, green: 0.847, blue: 1.0, alpha: 1.0).cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        return button
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
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
    }
    
    private func setStyle() {
        view.backgroundColor = .systemBackground
    }
    
    private func setUI() {
        view.addSubviews(userNameTextField, passwordTextField, loginButton, resultLabel, signUpButton)
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
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(30)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        resultLabel.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(40)
            $0.centerX.equalToSuperview()
        }
        
        signUpButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(50)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
    }
    
    @objc func loginButtonTapped() {
        userService.login(username: userNameTextField.text!, password: passwordTextField.text!) { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                
                switch result {
                case .success(let token):
                    
                    Keychain.shared.save(token: token, forKey: "authToken")
                    self.resultLabel.text = "로그인에 성공했어요."
                    
                    let hobbyVC = HobbyViewController()
                    self.navigationController?.pushViewController(hobbyVC, animated: true)
                    
                case .failure(let error):
                    self.resultLabel.text = error.errorMessage
                }
            }
        }
    }
    
    @objc func signUpButtonTapped() {
        let signUpVC = SignUpViewController()
        navigationController?.pushViewController(signUpVC, animated: true)
    }
}
