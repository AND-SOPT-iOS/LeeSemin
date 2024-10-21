//
//  AppInfo.swift
//  AND-SOPT-iOS
//
//  Created by 이세민 on 10/19/24.
//

import UIKit
import SnapKit

class AppInfo: UIViewController {
    
    private let appInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 1
        return stackView
    }()
    
    private let ratingsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        let attributedString = NSMutableAttributedString()
        
        let reviewsText = NSAttributedString(string: "8.4만개의 평가\n", attributes: [
            .font: UIFont.boldSystemFont(ofSize: 13),
            .foregroundColor: UIColor.gray
        ])
        attributedString.append(reviewsText)
        
        let ratingText = NSAttributedString(string: "4.4\n", attributes: [
            .font: UIFont.boldSystemFont(ofSize: 22),
            .foregroundColor: UIColor.gray
        ])
        attributedString.append(ratingText)
        
        let starsText = NSAttributedString(string: "★★★★☆", attributes: [
            .font: UIFont.systemFont(ofSize: 18),
            .foregroundColor: UIColor.gray
        ])
        attributedString.append(starsText)
        
        label.attributedText = attributedString
        return label
    }()
    
    private let awardsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        let attributedString = NSMutableAttributedString()
        
        let awardsText = NSAttributedString(string: "수상\n", attributes: [
            .font: UIFont.boldSystemFont(ofSize: 14),
            .foregroundColor: UIColor.gray
        ])
        attributedString.append(awardsText)
        
        let editorChoiceText = NSAttributedString(string: "에디터의 선택 ", attributes: [
            .font: UIFont.systemFont(ofSize: 14),
            .foregroundColor: UIColor.gray
        ])
        attributedString.append(editorChoiceText)
        
        let appText = NSAttributedString(string: "\n앱", attributes: [
            .font: UIFont.boldSystemFont(ofSize: 14),
            .foregroundColor: UIColor.gray
        ])
        attributedString.append(appText)
        
        label.attributedText = attributedString
        return label
    }()
    
    private let ageLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        let attributedString = NSMutableAttributedString()
        
        let ageText = NSAttributedString(string: "연령\n", attributes: [
            .font: UIFont.systemFont(ofSize: 14),
            .foregroundColor: UIColor.gray
        ])
        attributedString.append(ageText)
        
        let ageRatingText = NSAttributedString(string: "4+\n", attributes: [
            .font: UIFont.boldSystemFont(ofSize: 22),
            .foregroundColor: UIColor.gray
        ])
        attributedString.append(ageRatingText)
        
        let yearsText = NSAttributedString(string: "세", attributes: [
            .font: UIFont.systemFont(ofSize: 14),
            .foregroundColor: UIColor.gray
        ])
        attributedString.append(yearsText)
        
        label.attributedText = attributedString
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
    
    private func setUI() {
        view.addSubview(appInfoStackView)
        appInfoStackView.addArrangedSubview(ratingsLabel)
        appInfoStackView.addArrangedSubview(awardsLabel)
        appInfoStackView.addArrangedSubview(ageLabel)
    }
    
    private func setLayout() {
        appInfoStackView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(65)
        }
    }
}

