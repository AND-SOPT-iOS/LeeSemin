//
//  AppInfo.swift
//  AND-SOPT-iOS
//
//  Created by 이세민 on 10/19/24.
//

import UIKit
import SnapKit

class AppInfo: UIView {
    
    private let appInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        return stackView
    }()
    
    private let ratingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 4
        return stackView
    }()
    
    private let totalRatingsLabel: UILabel = {
        let label = UILabel()
        label.text = "8.4만개의 평가"
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textColor = .gray
        return label
    }()
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "4.4"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = .gray
        return label
    }()
    
    private let starRatingLabel: UILabel = {
        let label = UILabel()
        label.text = "★★★★☆"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .gray
        return label
    }()
    
    
    private let awardsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 4
        return stackView
    }()
    
    private let awardsTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "수상"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    private let editorChoiceLabel: UILabel = {
        let label = UILabel()
        let icon = NSTextAttachment()
        icon.image = UIImage(systemName: "person.fill")?.withTintColor(.systemGray)
        
        let attributedText = NSMutableAttributedString(attachment: icon)
        attributedText.append(NSAttributedString(string: " 에디터의 선택 ", attributes: [
            .foregroundColor: UIColor.gray,
            .font: UIFont.systemFont(ofSize: 12)
        ]))
        attributedText.append(NSAttributedString(attachment: icon))
        
        label.attributedText = attributedText
        
        return label
    }()
    
    
    private let appLabel: UILabel = {
        let label = UILabel()
        label.text = "앱"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    
    private let ageStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 4
        return stackView
    }()
    
    private let ageTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "연령"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    private let ageLabel: UILabel = {
        let label = UILabel()
        label.text = "4+"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = .gray
        return label
    }()
    
    private let yearsLabel: UILabel = {
        let label = UILabel()
        label.text = "세"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    private func createVerticalDividerLine() -> UIView {
        let view = UIView()
        view.backgroundColor = .systemGray
        return view
    }
    
    private lazy var firstDividerLine: UIView = createVerticalDividerLine()
    private lazy var secondDividerLine: UIView = createVerticalDividerLine()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        addSubview(appInfoStackView)
        
        [totalRatingsLabel, ratingLabel, starRatingLabel].forEach { ratingStackView.addArrangedSubview($0) }
        appInfoStackView.addArrangedSubview(ratingStackView)
        appInfoStackView.addArrangedSubview(firstDividerLine)
        
        [awardsTitleLabel, editorChoiceLabel, appLabel].forEach { awardsStackView.addArrangedSubview($0) }
        appInfoStackView.addArrangedSubview(awardsStackView)
        appInfoStackView.addArrangedSubview(secondDividerLine)
        
        [ageTitleLabel, ageLabel, yearsLabel].forEach { ageStackView.addArrangedSubview($0) }
        appInfoStackView.addArrangedSubview(ageStackView)
    }
    
    private func setLayout() {
        appInfoStackView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(65)
        }
        
        ratingStackView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(awardsStackView.snp.width)
            $0.width.equalTo(ageStackView.snp.width)
        }
        
        ageStackView.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        firstDividerLine.snp.makeConstraints {
            $0.width.equalTo(0.3)
        }
        
        secondDividerLine.snp.makeConstraints {
            $0.width.equalTo(0.3)
        }
    }
}
