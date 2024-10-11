//
//  ViewController.swift
//  Seminar-UIKit
//
//  Created by 이세민 on 10/11/24.
//

import UIKit

class ViewController: UIViewController {
    
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
    
    private let button1: UIButton = {
        let button = UIButton()
        button.setTitle("대한민국만세", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        return button
    }()
    
    private let button2: UIButton = {
        let button = UIButton()
        button.setTitle("대한민국만세", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        return button
    }()
    
    private let button3: UIButton = {
        let button = UIButton()
        button.setTitle("대한민국민세", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        return button
    }()
    
    private let button4: UIButton = {
        let button = UIButton()
        button.setTitle("대한민국만세", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        return button
    }()
    
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
    
    private func setupTextFieldActions() {
        nameTextField.addTarget(self, action: #selector(updateNextButtonState), for: .editingChanged)
    }
    
    private func setupButtonActions() {
        button1.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        button2.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        button3.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        button4.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        selectedButton?.layer.borderColor = UIColor.darkGray.cgColor
        
        if selectedButton != sender {
            selectedButton = sender
            sender.layer.borderColor = UIColor.blue.cgColor
        } else {
            selectedButton = nil
            sender.layer.borderColor = UIColor.darkGray.cgColor
        }
        
        updateNextButtonState()
    }
    
    @objc private func updateNextButtonState() {
        if let name = nameTextField.text, !name.isEmpty, selectedButton != nil {
            nextButton.alpha = 1.0
        } else {
            nextButton.alpha = 0.5
        }
    }
    
    @objc func nextButtonTapped() {
        guard let name = nameTextField.text, !name.isEmpty, selectedButton != nil else {
            return
        }
        
        transitionToNextViewController()
    }
    
    private func transitionToNextViewController() {
        let nextViewController = DetailViewController()
        
        guard let name = nameTextField.text
        else{
            return
        }
        
        let isButton3Selected = (selectedButton == button3)
        
        nextViewController.dataBind(name: name, isButton3Selected: isButton3Selected)
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
    
    private func updateUI() {
        let modeText = pushMode ? "네비게이션" : "모달"
        self.modeLabel.text = "현재 모드 : \(modeText)"
    }
    
    @objc func toggleButtonTapped() {
        self.pushMode.toggle()
        self.updateUI()
    }
    
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
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview($0)
        }
    }
    
    private func setLayout(){
        NSLayoutConstraint.activate(
            [
                titleLabel.topAnchor.constraint(
                    equalTo: view.safeAreaLayoutGuide.topAnchor,
                    constant: 15
                ),
                titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                modeLabel.topAnchor.constraint(
                    equalTo: titleLabel.bottomAnchor,
                    constant: 10
                ),
                modeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                nameTextField.topAnchor.constraint(
                    equalTo: modeLabel.bottomAnchor,
                    constant: 20
                ),
                nameTextField.leadingAnchor.constraint(
                    equalTo: view.leadingAnchor,
                    constant: 20
                ),
                nameTextField.trailingAnchor.constraint(
                    equalTo: view.trailingAnchor,
                    constant: -20
                ),
                nameTextField.heightAnchor.constraint(equalToConstant: 40),
                
                button1.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 25),
                button1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                button1.widthAnchor.constraint(equalToConstant: (view.frame.width - 60) / 2),
                button1.heightAnchor.constraint(equalToConstant: 180),
                
                button2.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 25),
                button2.leadingAnchor.constraint(equalTo: button1.trailingAnchor, constant: 10),
                button2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                button2.heightAnchor.constraint(equalToConstant: 180),
                
                button3.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 10),
                button3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                button3.widthAnchor.constraint(equalToConstant: (view.frame.width - 60) / 2),
                button3.heightAnchor.constraint(equalToConstant: 180),
                
                button4.topAnchor.constraint(equalTo: button2.bottomAnchor, constant: 10),
                button4.leadingAnchor.constraint(equalTo: button3.trailingAnchor, constant: 10),
                button4.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                button4.heightAnchor.constraint(equalToConstant: 180),
                
                nextButton.topAnchor.constraint(
                    equalTo: button3.bottomAnchor,
                    constant: 30
                ),
                nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                nextButton.heightAnchor.constraint(equalToConstant: 44),
                nextButton.widthAnchor.constraint(equalToConstant: 300),
                
                pushModeToggleButton.topAnchor.constraint(
                    equalTo: nextButton.bottomAnchor,
                    constant: 20
                ),
                pushModeToggleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                pushModeToggleButton.heightAnchor.constraint(equalToConstant: 44),
                pushModeToggleButton.widthAnchor.constraint(equalToConstant: 300),
            ]
        )
    }
}
