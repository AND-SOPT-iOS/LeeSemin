//
//  DeveloperInfo.swift
//  AND-SOPT-iOS
//
//  Created by 이세민 on 10/20/24.
//

import UIKit
import SnapKit

class DeveloperInfo: UIView {
    
    private var isExpanded: Bool = false
    
    private let fullText: String = """
    토스뱅크, 토스증권 서비스를 이용하시려면 토스 앱
    설치가 필요합니다.
    
    ● 내 금융 현황을 한눈에, 홈•소비
    • 모든 계좌의 모든 정보를 한 곳에서, 따로 보았던 예적금,
    청약, 증권, 대출 계좌의 정보를 한 곳에서 확인할 수
    있어요.
    • 얼마나 벌고 얼마나 썼을까? 한 달 동안의 수입과 소비를
    시간순으로 모아볼 수 있고, 소비 분석 리포트도 제공
    해드려요.
    • 카드 실적 헷갈릴 필요 없이, 실적을 충족한 카드가 무엇
    인지 얼마나 더 써야 실적을 달성하는지 한눈에 확인할
    수 있어요.
    • 매달 고정적으로 나가는 보험비, 생활요금, 구독료 등도
    쉽게 확인할 수 있어요.
    
    ● 평생 무료로 간편하고 안전하게, 송금
    • 송금을 자유롭게, 토스에서는 은행 상관없이 수수료가
    평생 무료에요.
    어쩌고 저쩌고
    """
    
    private lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 4
        label.textColor = .white
        label.text = String(fullText.prefix(150))
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
        addSubviews(contentLabel, moreButton, developerLabel, nextButton, secondDeveloperLabel)
    }
    
    private func setLayout() {
        contentLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
        }
        
        moreButton.snp.makeConstraints {
            $0.top.equalTo(contentLabel.snp.bottom).offset(-25)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        developerLabel.snp.makeConstraints {
            $0.top.equalTo(contentLabel.snp.bottom).offset(20)
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
        contentLabel.numberOfLines = 0
        moreButton.isHidden = true
        contentLabel.text = fullText
        
        isExpanded.toggle()
    }
}

