//
//  WhatsNew.swift
//  AND-SOPT-iOS
//
//  Created by 이세민 on 10/19/24.
//

import UIKit
import SnapKit

class WhatsNew: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "새로운 소식"
        label.font = .systemFont(ofSize: 22, weight: .heavy)
        label.textColor = .white
        return label
    }()
    
    private var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "chevron.right", withConfiguration: UIImage.SymbolConfiguration(weight: .bold)), for: .normal)
        button.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        button.tintColor = .systemGray
        return button
    }()
    
//    private let versionHistoryButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("버전 기록", for: .normal)
//        button.setTitleColor(.systemBlue, for: .normal)
//        return button
//    }()
    
    private let versionLabel: UILabel = {
        let label = UILabel()
        label.text = "버전 5.185.0"
        label.font = .systemFont(ofSize: 16)
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
        [titleLabel, nextButton, /*versionHistoryButton,*/ versionLabel, dateLabel, updateContentLabel].forEach {
            view.addSubview($0)
        }
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.top.equalToSuperview()
        }
        
        nextButton.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.trailing).offset(3)
            $0.centerY.equalTo(titleLabel)
        }
        
//        versionHistoryButton.snp.makeConstraints{
//            $0.trailing.equalToSuperview().offset(-20)
//            $0.centerY.equalTo(titleLabel)
//        }
        
        versionLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
        }
        
        dateLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-20)
            $0.centerY.equalTo(versionLabel)
        }
        
        updateContentLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.top.equalTo(versionLabel.snp.bottom).offset(20)
        }
    }
}
