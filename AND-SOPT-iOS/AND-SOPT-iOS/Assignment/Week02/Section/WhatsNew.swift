//
//  WhatsNew.swift
//  AND-SOPT-iOS
//
//  Created by 이세민 on 10/19/24.
//

import UIKit
import SnapKit

class WhatsNew: UIViewController {
    
    private let whatsNewButton: UIButton = {
        let button = UIButton()
        let icon = UIImage(systemName: "chevron.right", withConfiguration: UIImage.SymbolConfiguration(weight: .bold))
        button.setImage(icon, for: .normal)
        button.tintColor = .systemGray
        button.setTitle("새로운 소식 ", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.semanticContentAttribute = .forceRightToLeft
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .heavy)
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
        label.textColor = .white
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
    
    private func setUI() {
        [whatsNewButton, versionLabel, dateLabel, updateContentLabel].forEach {
            view.addSubview($0)
        }
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
}
