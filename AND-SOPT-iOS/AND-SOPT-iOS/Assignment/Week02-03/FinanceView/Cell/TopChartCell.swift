//
//  TopChartCell.swift
//  AND-SOPT-iOS
//
//  Created by 이세민 on 11/1/24.
//

import UIKit
import SnapKit

import Then

class TopChartCell: UITableViewCell {
    static let identifier: String = "TopChartCell"
    
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
        label.font = .systemFont(ofSize: 17, weight: .bold)
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        addSubviews(logoImageView, rankLabel, titleLabel, descriptionLabel, downloadStateButton)
    }
    
    private func setLayout() {
        logoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(15)
            $0.width.height.equalTo(65)
        }
        
        rankLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(17)
            $0.leading.equalTo(logoImageView.snp.trailing).offset(10)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(17)
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
    }
    
    func configure(_ financeAppList: FinanceAppList) {
        logoImageView.image = financeAppList.logoImage
        titleLabel.text = financeAppList.title
        descriptionLabel.text = financeAppList.description
        downloadStateButton.setTitle(financeAppList.downloadState, for: .normal)
        rankLabel.isHidden = !financeAppList.isRank
        
        if let rank = financeAppList.rank {
            rankLabel.text = "\(rank)"
        } else {
            rankLabel.text = nil
        }
    }
}
