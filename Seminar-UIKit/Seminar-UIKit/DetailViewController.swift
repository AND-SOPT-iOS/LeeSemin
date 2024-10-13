//
//  DetailViewController.swift
//  Seminar-UIKit
//
//  Created by 이세민 on 10/11/24.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 35, weight: .regular)
        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("이전 화면으로", for: .normal)
        button.backgroundColor = .tintColor
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private var receivedName: String?
    private var isButton3Selected: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setUI()
        setLayout()
        updateUI()
    }
    
    private func setStyle() {
        self.view.backgroundColor = .white
    }
    
    private func setUI() {
        [nameLabel, resultLabel, imageView, backButton].forEach {
            self.view.addSubview($0)
        }
    }
    
    private func setLayout() {
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.centerX.equalToSuperview()
        }
        
        resultLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        
        imageView.snp.makeConstraints {
            $0.top.equalTo(resultLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(300)
        }
        
        backButton.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(44)
            $0.width.equalTo(300)
        }
    }
    
    func updateUI() {
        self.nameLabel.text = receivedName
        
        self.resultLabel.text = isButton3Selected ? "축하합니다" : "분발하세요"
        self.imageView.image = UIImage(named: isButton3Selected ? "good.jpg" : "icecream.jpg")
    }
    
    func dataBind(name: String, isButton3Selected: Bool) {
        self.receivedName = name
        self.isButton3Selected = isButton3Selected
        updateUI()
    }
    
    @objc func backButtonTapped() {
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
}
