//
//  FindDifferentButtonViewController.swift
//  Seminar-UIKit
//
//  Created by 이세민 on 10/11/24.
//

import UIKit
import SnapKit

class FindDifferentButtonViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "한글날은 지났지만\n다르게 적힌 글자 찾아보기"
        label.font = .systemFont(ofSize: 27)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let modeLabel: UILabel = {
        let label = UILabel()
        label.text = "네비게이션"
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "이름을 입력해주세요."
        textField.clearButtonMode = .whileEditing
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        textField.textAlignment = .center
        return textField
    }()
    
    private func createButton(title: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        return button
    }
    
    private lazy var button1: UIButton = createButton(title: "대한민국만세")
    private lazy var button2: UIButton = createButton(title: "대한민국만세")
    private lazy var button3: UIButton = createButton(title: "대한민국민세")
    private lazy var button4: UIButton = createButton(title: "대한민국만세")
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("다음", for: .normal)
        button.backgroundColor = .tintColor
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var pushModeToggleButton: UIButton = {
        let button = UIButton()
        button.setTitle("전환 모드 변경", for: .normal)
        button.backgroundColor = .tintColor
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(toggleButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private var pushMode = true
    private var selectedButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setUI()
        setLayout()
        setupButtonActions()
        updateNextButtonState()
        setupTextFieldActions()
    }
    
    private func setStyle() {
        self.view.backgroundColor = .white
        updateUI()
    }
    
    private func setUI() {
        [
            titleLabel,
            modeLabel,
            nameTextField,
            nextButton,
            pushModeToggleButton,
            button1,
            button2,
            button3,
            button4
        ].forEach {
            self.view.addSubview($0)
        }
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(15)
            $0.centerX.equalToSuperview()
        }
        
        modeLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }
        
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(modeLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(40)
        }
        
        button1.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).offset(25)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo((view.frame.width - 60) / 2)
            $0.height.equalTo(180)
        }
        
        button2.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).offset(25)
            $0.leading.equalTo(button1.snp.trailing).offset(10)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(180)
        }
        
        button3.snp.makeConstraints {
            $0.top.equalTo(button1.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo((view.frame.width - 60) / 2)
            $0.height.equalTo(180)
        }
        
        button4.snp.makeConstraints {
            $0.top.equalTo(button2.snp.bottom).offset(10)
            $0.leading.equalTo(button3.snp.trailing).offset(10)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(180)
        }
        
        nextButton.snp.makeConstraints {
            $0.top.equalTo(button3.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(44)
            $0.width.equalTo(300)
        }
        
        pushModeToggleButton.snp.makeConstraints {
            $0.top.equalTo(nextButton.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(44)
            $0.width.equalTo(300)
        }
    }
    
    private func setupTextFieldActions() {
        nameTextField.addTarget(self, action: #selector(updateNextButtonState), for: .editingChanged)
    }
    
    private func setupButtonActions() {
        let buttons = [button1, button2, button3, button4]
        for button in buttons {
            button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        }
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        selectedButton?.layer.borderColor = UIColor.darkGray.cgColor
        
        if selectedButton == sender {
            selectedButton = nil
        } else {
            selectedButton = sender
        }
        sender.layer.borderColor = selectedButton == nil ? UIColor.darkGray.cgColor : UIColor.blue.cgColor
        
        updateNextButtonState()
    }
    
    @objc func toggleButtonTapped() {
        self.pushMode.toggle()
        self.updateUI()
    }
    
    private func updateUI() {
        let modeText = pushMode ? "네비게이션" : "모달"
        self.modeLabel.text = "현재 모드 : \(modeText)"
    }
    
    @objc private func updateNextButtonState() {
        nextButton.alpha = (nameTextField.text?.isEmpty == false && selectedButton != nil) ? 1.0 : 0.5
    }

    @objc func nextButtonTapped() {
        if nameTextField.text?.isEmpty == false && selectedButton != nil {
            transitionToNextViewController()
        }
    }
    
    private func transitionToNextViewController() {
        let nextViewController = ResultViewController()
        
        guard let name = nameTextField.text
        else{
            return
        }
        
        let isAnswerSelected = (selectedButton == button3)
        
        nextViewController.dataBind(name: name, isAnswerSelected: isAnswerSelected)
        if pushMode {
            self.navigationController?.pushViewController(
                nextViewController,
                animated: true
            )
        } else {
            self.present(
                nextViewController,
                animated: true
            )
        }
    }
    
}
