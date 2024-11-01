//
//  Review.swift
//  AND-SOPT-iOS
//
//  Created by 이세민 on 10/21/24.
//

import UIKit

import SnapKit
import Then

protocol ReviewDelegate: AnyObject {
    func didTapMoreReviewButton()
}

class Review: UIView {
    
    weak var delegate: ReviewDelegate?
    
    private lazy var moreReviewButton: UIButton = {
        let button = UIButton()
        let icon = UIImage(systemName: "chevron.right", withConfiguration: UIImage.SymbolConfiguration(weight: .bold))
        button.setImage(icon, for: .normal)
        button.tintColor = .systemGray
        button.setTitle("평가 및 리뷰 ", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.semanticContentAttribute = .forceRightToLeft
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .heavy)
        button.addTarget(self, action: #selector(moreReviewButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "4.4"
        label.font = .systemFont(ofSize: 57, weight: .heavy)
        label.textColor = .label
        return label
    }()
    
    private let starRatingLabel: UILabel = {
        let label = UILabel()
        label.text = "★ ★ ★ ★ ☆"
        label.font = .systemFont(ofSize: 20, weight: .heavy)
        label.textColor = .label
        return label
    }()
    
    private let totalRatingsLabel: UILabel = {
        let label = UILabel()
        label.text = "8.4만개의 평가"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .systemGray
        return label
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        return scrollView
    }()
    
    private let reviewStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 50
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let tapToRateLabel: UILabel = {
        let label = UILabel()
        label.text = "탭하여 평가하기"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .label
        return label
    }()
    
    private let starStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private var starButtons: [UIButton] = []
    private var currentRating: Int = 0
    
    private lazy var writeReviewButton = UIButton.createButton(title: "리뷰 작성", iconName: "square.and.pencil")
    private lazy var appSupportButton = UIButton.createButton(title: "앱 지원", iconName: "questionmark.circle")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
        setReviewContentViews()
        configureStarRating()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setReviewContentViews() {
        for reviewData in ReviewData.mockData {
            reviewStackView.addArrangedSubview(createReviewContentView(with: reviewData))
        }
    }
    
    private func setUI() {
        addSubviews(moreReviewButton, ratingLabel, starRatingLabel, totalRatingsLabel, scrollView, tapToRateLabel, starStackView, writeReviewButton, appSupportButton)
        scrollView.addSubview(reviewStackView)
    }
    
    private func setLayout() {
        moreReviewButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
        }
        
        ratingLabel.snp.makeConstraints {
            $0.top.equalTo(moreReviewButton.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(20)
        }
        
        starRatingLabel.snp.makeConstraints {
            $0.top.equalTo(moreReviewButton.snp.bottom).offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        totalRatingsLabel.snp.makeConstraints {
            $0.top.equalTo(moreReviewButton.snp.bottom).offset(45)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(totalRatingsLabel.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview()
        }
        
        reviewStackView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalToSuperview()
        }
        
        tapToRateLabel.snp.makeConstraints {
            $0.top.equalTo(scrollView.snp.bottom).offset(25)
            $0.centerX.equalToSuperview()
        }
        
        starStackView.snp.makeConstraints {
            $0.top.equalTo(tapToRateLabel.snp.bottom).offset(8)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(200)
        }
        
        writeReviewButton.snp.makeConstraints {
            $0.top.equalTo(starStackView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(40)
            $0.width.equalTo(152)
            $0.height.equalTo(50)
        }
        
        appSupportButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-40)
            $0.centerY.equalTo(writeReviewButton)
            $0.width.equalTo(152)
            $0.height.equalTo(50)
        }
    }
    
    @objc private func moreReviewButtonTapped() {
        delegate?.didTapMoreReviewButton()
    }
    
    private func configureStarRating() {
        for i in 1...5 {
            let button = UIButton()
            button.setImage(UIImage(systemName: "star", withConfiguration: UIImage.SymbolConfiguration(pointSize: 22, weight: .bold)), for: .normal)
            button.tintColor = .systemBlue
            button.tag = i
            button.addTarget(self, action: #selector(starTapped(_:)), for: .touchUpInside)
            starButtons.append(button)
            starStackView.addArrangedSubview(button)
        }
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        starStackView.addGestureRecognizer(panGesture)
    }
    
    @objc private func starTapped(_ sender: UIButton) {
        updateRating(to: sender.tag)
    }
    
    @objc private func handlePanGesture(_ gesture: UIPanGestureRecognizer) {
        let location = gesture.location(in: starStackView)
        let starWidth = starStackView.frame.width / CGFloat(starButtons.count)
        let rating = Int(location.x / starWidth) + 1
        updateRating(to: rating)
    }
    
    private func updateRating(to rating: Int) {
        currentRating = rating
        starButtons.enumerated().forEach { index, button in
            let imageName = index < rating ? "star.fill" : "star"
            button.setImage(UIImage(systemName: imageName, withConfiguration: UIImage.SymbolConfiguration(pointSize: 22, weight: .bold)), for: .normal)
        }
    }
    
    private func createReviewContentView(with reviewData: ReviewData) -> UIView {
        let reviewContentView = UIView()
        reviewContentView.backgroundColor = .tertiarySystemGroupedBackground
        reviewContentView.layer.cornerRadius = 15
        reviewContentView.clipsToBounds = true
        
        let reviewTitleLabel = UILabel.createLabel(text: reviewData.reviewTitle, fontSize: 17, weight: .heavy, color: .label)
        let reviewRatingLabel = UILabel.createLabel(text: reviewData.reviewRating, fontSize: 13, color: .label)
        let reviewDateLabel = UILabel.createLabel(text: reviewData.reviewDate, fontSize: 15, color: .lightGray)
        let reviewerLabel = UILabel.createLabel(text: reviewData.reviewer, fontSize: 15, color: .lightGray)
        let reviewContentLabel = UILabel.createLabel(text: reviewData.reviewContent, fontSize: 15, color: .lightGray, lines: 2)
        let developerLabel = UILabel.createLabel(text: reviewData.developer, fontSize: 15, color: .label)
        let answerDateLabel = UILabel.createLabel(text: reviewData.answerDate, fontSize: 15, color: .lightGray)
        let answerContentLabel = UILabel.createLabel(text: reviewData.answerContent, fontSize: 15, color: .lightGray, lines: 2)
        
        reviewContentView.addSubviews(reviewTitleLabel, reviewRatingLabel, reviewDateLabel, reviewerLabel, reviewContentLabel, developerLabel, answerDateLabel, answerContentLabel)
        
        reviewContentView.snp.makeConstraints{
            $0.width.equalTo(340)
            $0.height.equalTo(190)
        }
        
        reviewTitleLabel.snp.makeConstraints{
            $0.top.equalTo(reviewContentView).offset(18)
            $0.leading.equalToSuperview().offset(25)
        }
        
        reviewRatingLabel.snp.makeConstraints{
            $0.top.equalTo(reviewTitleLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(25)
        }
        
        reviewDateLabel.snp.makeConstraints{
            $0.leading.equalTo(reviewRatingLabel.snp.trailing).offset(8)
            $0.centerY.equalTo(reviewRatingLabel)
        }
        
        reviewerLabel.snp.makeConstraints{
            $0.leading.equalTo(reviewDateLabel.snp.trailing).offset(5)
            $0.centerY.equalTo(reviewRatingLabel)
        }
        
        reviewContentLabel.snp.makeConstraints{
            $0.top.equalTo(reviewRatingLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(25)
        }
        
        developerLabel.snp.makeConstraints{
            $0.top.equalTo(reviewContentLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(25)
        }
        
        answerDateLabel.snp.makeConstraints{
            $0.leading.equalTo(developerLabel.snp.trailing).offset(8)
            $0.centerY.equalTo(developerLabel)
        }
        
        answerContentLabel.snp.makeConstraints{
            $0.top.equalTo(developerLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(25)
        }
        
        return reviewContentView
    }
}

extension UILabel {
    static func createLabel(text: String, fontSize: CGFloat, weight: UIFont.Weight = .regular, color: UIColor = .white, lines: Int = 1) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = .systemFont(ofSize: fontSize, weight: weight)
        label.textColor = color
        label.numberOfLines = lines
        return label
    }
}

extension UIButton {
    static func createButton(title: String, iconName: String) -> UIButton {
        let button = UIButton()
        let icon = UIImage(systemName: iconName)
        button.setImage(icon, for: .normal)
        button.setTitle("  \(title)", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.backgroundColor = .tertiarySystemGroupedBackground
        button.layer.cornerRadius = 18
        button.clipsToBounds = true
        button.tintColor = .systemBlue
        button.semanticContentAttribute = .forceLeftToRight
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .heavy)
        return button
    }
}
