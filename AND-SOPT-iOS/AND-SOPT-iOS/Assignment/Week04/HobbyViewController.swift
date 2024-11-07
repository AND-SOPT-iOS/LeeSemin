//
//  HobbyViewController.swift
//  AND-SOPT-iOS
//
//  Created by 이세민 on 11/8/24.
//

import UIKit

class HobbyViewController: UIViewController {
    
    private let myHobbyLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 25)
        label.text = "내 취미는"
        return label
    }()
    
    private let myHobbyValueLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.text = "Loading..."
        label.font = .systemFont(ofSize: 40)
        label.numberOfLines = 2
        return label
    }()
    
    private let changeButton: UIButton = {
        let button = UIButton()
        button.setTitle("내 정보 변경하러 가기", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = UIColor(red: 0.9, green: 0.6, blue: 0.5, alpha: 1.0)
        return button
    }()
    
    private let otherHobbyLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.text = "다른 사람의 취미는"
        label.font = .systemFont(ofSize: 25)
        return label
    }()
    
    private let searchUserNoTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "userNo"
        textField.textColor = .label
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        return textField
    }()
    
    private let searchButton: UIButton = {
        let button = UIButton()
        button.setTitle("🔍", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        return button
    }()
    
    
    private let otherHobbyValueLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.text = ""
        label.font = .systemFont(ofSize: 30)
        label.numberOfLines = 2
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTargets()
        setStyle()
        setUI()
        setLayout()
        fetchMyHobby()
    }
    
    private func setTargets() {
        searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
    }
    
    private func setStyle() {
        view.backgroundColor = .systemBackground
    }
    
    private func setUI() {
        view.addSubviews(myHobbyLabel, myHobbyValueLabel, changeButton, otherHobbyLabel, otherHobbyValueLabel, searchUserNoTextField, searchButton)
    }
    
    private func setLayout() {
        myHobbyLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(60)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        myHobbyValueLabel.snp.makeConstraints {
            $0.top.equalTo(myHobbyLabel.snp.bottom).offset(40)
            $0.centerX.equalToSuperview()
        }
        
        changeButton.snp.makeConstraints {
            $0.top.equalTo(myHobbyValueLabel.snp.bottom).offset(50)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        otherHobbyLabel.snp.makeConstraints {
            $0.top.equalTo(changeButton.snp.bottom).offset(100)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        searchUserNoTextField.snp.makeConstraints {
            $0.top.equalTo(otherHobbyLabel.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(75)
            $0.width.equalTo(200)
        }
        
        searchButton.snp.makeConstraints {
            $0.top.equalTo(otherHobbyLabel.snp.bottom).offset(30)
            $0.leading.equalTo(searchUserNoTextField.snp.trailing).offset(20)
            $0.centerY.equalTo(searchUserNoTextField)
        }
        
        otherHobbyValueLabel.snp.makeConstraints {
            $0.top.equalTo(searchButton.snp.bottom).offset(40)
            $0.centerX.equalToSuperview()
        }
        
    }
    
    private func fetchMyHobby() {
        guard let token = Keychain.shared.read(forKey: "authToken") else {
            myHobbyValueLabel.text = "로그인이 필요합니다."
            return
        }
        
        UserService().getMyHobby(token: token) { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                
                switch result {
                case .success(let hobby):
                    self.myHobbyValueLabel.text = "˗ˋˏ \(hobby) ˎˊ˗ "
                case .failure(let error):
                    self.myHobbyValueLabel.text = "\(error.errorMessage)"
                }
            }
        }
    }
    
    private func fetchOtherHobby(userNo: Int) {
        guard let token = Keychain.shared.read(forKey: "authToken") else {
            otherHobbyValueLabel.text = "로그인이 필요합니다."
            return
        }
        
        UserService().getUserHobby(userNo: userNo, token: token) { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                
                switch result {
                case .success(let hobby):
                    self.otherHobbyValueLabel.text = "\(hobby) "
                case .failure(let error):
                    self.otherHobbyValueLabel.text = "\(error.errorMessage)"
                }
            }
        }
    }
    
    @objc private func searchButtonTapped() {
        guard let userNoText = searchUserNoTextField.text, let userNo = Int(userNoText) else {
            otherHobbyValueLabel.text = "유효한 유저 번호를 입력하세요."
            return
        }
        
        fetchOtherHobby(userNo: userNo)
    }
}
