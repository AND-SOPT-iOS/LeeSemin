//
//  DeveloperInfo.swift
//  AND-SOPT-iOS
//
//  Created by 이세민 on 10/20/24.
//

import UIKit

import SnapKit
import Then

class DeveloperInfo: UIView {
    
    private var isExpanded: Bool = false
    
    private var firstContentLabel: UILabel = {
        let label = UILabel()
        label.text = "토스뱅크, 토스증권 서비스를 이용하시려면 토스 앱 설치가\n필요합니다.\n"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .label
        label.numberOfLines = 0
        return label
    }()
    
    private let secondContentLabel: UILabel = {
        let label = UILabel()
        label.text = "● 내 금융 현황을 한눈에, 홈·소비"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .label
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var moreButton: UIButton = {
        let button = UIButton()
        button.setTitle("더 보기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.addTarget(self, action: #selector(moreButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let developerLabel: UILabel = {
        let label = UILabel()
        label.text = "Viva Republica"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .systemBlue
        label.numberOfLines = 0
        return label
    }()
    
    private var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "chevron.right", withConfiguration: UIImage.SymbolConfiguration(weight: .bold)), for: .normal)
        button.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        button.tintColor = .systemGray
        return button
    }()
    
    private let secondDeveloperLabel: UILabel = {
        let label = UILabel()
        label.text = "개발자"
        label.font = .systemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        addSubviews(firstContentLabel, secondContentLabel, moreButton, developerLabel, nextButton, secondDeveloperLabel)
    }
    
    private func setLayout() {
        firstContentLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
        }
        
        secondContentLabel.snp.makeConstraints {
            $0.top.equalTo(firstContentLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(20)
        }
        
        moreButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-20)
            $0.centerY.equalTo(secondContentLabel)
        }
        
        developerLabel.snp.makeConstraints {
            $0.top.equalTo(secondContentLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
        }
        
        nextButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-20)
            $0.centerY.equalTo(developerLabel)
        }
        
        secondDeveloperLabel.snp.makeConstraints {
            $0.top.equalTo(developerLabel.snp.bottom)
            $0.leading.equalToSuperview().offset(20)
        }
    }
    
    @objc private func moreButtonTapped() {
        if !isExpanded {
            secondContentLabel.numberOfLines = 0
            secondContentLabel.text = DeveloperInfoLabels.fullText
            moreButton.isHidden = true
        }
        
        isExpanded.toggle()
    }
}

