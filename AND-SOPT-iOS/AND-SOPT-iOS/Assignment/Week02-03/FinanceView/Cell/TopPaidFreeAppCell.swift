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
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let rankLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.textColor = .label
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.textColor = .label
        label.numberOfLines = 2
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .lightGray
        label.numberOfLines = 2
        return label
    }()
    
    private let downloadStateButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.systemBlue, for: .normal)
        button.backgroundColor = .tertiarySystemGroupedBackground
        button.layer.cornerRadius = 18
        button.clipsToBounds = true
        button.tintColor = .systemBlue
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .heavy)
        return button
    }()
    
    private let inAppPurchasesLabel: UILabel = {
        let label = UILabel()
        label.text = "앱 내 구입"
        label.font = .systemFont(ofSize: 10)
        label.textColor = .lightGray
        label.isHidden = true
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
        } else {
            rankLabel.text = nil
        }
    }
}
