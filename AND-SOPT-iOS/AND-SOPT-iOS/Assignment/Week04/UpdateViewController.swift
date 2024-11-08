//
//  UpdateViewController.swift
//  AND-SOPT-iOS
//
//  Created by 이세민 on 11/8/24.
//

import UIKit

class UpdateViewController: UIViewController {
    
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
    
    private let changeButton: UIButton = {
        let button = UIButton()
        button.setTitle("정보 변경하기", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.layer.borderColor = UIColor(red: 0.9, green: 0.6, blue: 0.5, alpha: 1.0).cgColor
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
        changeButton.addTarget(self, action: #selector(changeButtonTapped), for: .touchUpInside)
    }
    
    private func setStyle() {
        view.backgroundColor = .systemBackground
    }
    
    private func setUI() {
        view.addSubviews(passwordTextField, hobbyTextField, changeButton)
    }
    
    private func setLayout() {
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(180)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        hobbyTextField.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        changeButton.snp.makeConstraints {
            $0.top.equalTo(hobbyTextField.snp.bottom).offset(30)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
    }
    
    @objc private func changeButtonTapped() {
        guard let token = Keychain.shared.read(forKey: "authToken") else {
            print("로그인이 필요합니다.")
            return
        }
        
        UserService().updateUserInfo(token: token, hobby: hobbyTextField.text!, password: passwordTextField.text!) { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                
                switch result {
                case .success:
                    print("정보가 성공적으로 변경되었습니다.")
                case .failure(let error):
                    print("오류 발생: \(error.errorMessage)")
                }
            }
        }
    }
}
