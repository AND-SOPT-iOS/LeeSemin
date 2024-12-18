//
//  WhatsNew.swift
//  AND-SOPT-iOS
//
//  Created by 이세민 on 10/19/24.
//

import UIKit

import SnapKit
import Then

protocol WhatsNewDelegate: AnyObject {
    func didTapWhatsNewButton()
}

class WhatsNew: UIView {
    
    weak var delegate: WhatsNewDelegate?
    
    private lazy var whatsNewButton: UIButton = {
        let button = UIButton()
        let icon = UIImage(systemName: "chevron.right", withConfiguration: UIImage.SymbolConfiguration(weight: .bold))
        button.setImage(icon, for: .normal)
        button.tintColor = .systemGray
        button.setTitle("새로운 소식 ", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.semanticContentAttribute = .forceRightToLeft
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .heavy)
        button.addTarget(self, action: #selector(whatsNewButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let versionLabel: UILabel = {
        let label = UILabel()
        label.text = "버전 5.185.0"
        label.font = .systemFont(ofSize: 15)
        label.textColor = .lightGray
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "2일 전"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .lightGray
        return label
    }()
    
    private let updateContentLabel: UILabel = {
        let label = UILabel()
        label.text = "• 구석구석 숨어있던 버그들을 잡았어요. 또 다른 버그가\n나타나면 토스 고객센터를 찾아주세요. 늘 열려있답니다.\n365일 24시간 언제든지요."
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        label.textColor = .label
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
        addSubviews(whatsNewButton, versionLabel, dateLabel, updateContentLabel)
    }
    
    private func setLayout() {
        whatsNewButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
        }
        
        versionLabel.snp.makeConstraints {
            $0.top.equalTo(whatsNewButton.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(20)
        }
        
        dateLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-20)
            $0.centerY.equalTo(versionLabel)
        }
        
        updateContentLabel.snp.makeConstraints {
            $0.top.equalTo(versionLabel.snp.bottom).offset(15)
            $0.leading.equalToSuperview().offset(20)
        }
    }
    
    @objc private func whatsNewButtonTapped() {
        delegate?.didTapWhatsNewButton()
    }
}
