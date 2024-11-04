//
//  TopPaidFreeAppCell.swift
//  AND-SOPT-iOS
//
//  Created by 이세민 on 11/1/24.
//

import UIKit

import SnapKit
import Then

class TopPaidFreeAppCell: UICollectionViewCell {
    static let identifier = "TopPaidFreeAppCell"
    
    private let logoImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.layer.cornerRadius = 20
        $0.clipsToBounds = true
    }
    
    private let rankLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 17, weight: .bold)
        $0.textColor = .label
    }
    
    private let titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 17)
        $0.textColor = .label
        $0.numberOfLines = 2
    }
    
    private let descriptionLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .lightGray
        $0.numberOfLines = 2
    }
    
    private let downloadStateButton = UIButton().then {
        $0.setTitleColor(.systemBlue, for: .normal)
        $0.backgroundColor = .tertiarySystemGroupedBackground
        $0.layer.cornerRadius = 18
        $0.clipsToBounds = true
        $0.tintColor = .systemBlue
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .heavy)
    }
    
    private let inAppPurchasesLabel = UILabel().then {
        $0.text = "앱 내 구입"
        $0.font = .systemFont(ofSize: 10)
        $0.textColor = .lightGray
        $0.isHidden = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        addSubviews(logoImageView, rankLabel, titleLabel, descriptionLabel, downloadStateButton, inAppPurchasesLabel)
    }
    
    private func setLayout() {
        logoImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(15)
            $0.width.height.equalTo(65)
        }
        
        rankLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.leading.equalTo(logoImageView.snp.trailing).offset(10)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.leading.equalTo(rankLabel.snp.trailing).offset(10)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
            $0.leading.equalTo(titleLabel)
        }
        
        downloadStateButton.snp.makeConstraints{
            $0.trailing.equalToSuperview().offset(-20)
            $0.centerY.equalTo(logoImageView)
            $0.width.equalTo(86)
            $0.height.equalTo(35)
        }
        
        inAppPurchasesLabel.snp.makeConstraints{
            $0.top.equalTo(downloadStateButton.snp.bottom).offset(5)
            $0.centerX.equalTo(downloadStateButton)
        }
    }
    
    func bind(_ financeAppList: FinanceAppList) {
        logoImageView.image = financeAppList.logoImage
        titleLabel.text = financeAppList.title
        descriptionLabel.text = financeAppList.description
        downloadStateButton.setTitle(financeAppList.downloadState, for: .normal)
        inAppPurchasesLabel.isHidden = !financeAppList.isInAppPurchases
        rankLabel.isHidden = !financeAppList.isRank
        
        if let rank = financeAppList.rank {
            rankLabel.text = "\(rank)"
            rankLabel.isHidden = false
        } else {
            rankLabel.isHidden = true
        }
    }
}
