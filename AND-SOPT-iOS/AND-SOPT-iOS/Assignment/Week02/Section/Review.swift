//
//  Review.swift
//  AND-SOPT-iOS
//
//  Created by 이세민 on 10/21/24.
//

import UIKit
import SnapKit

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
        button.setTitleColor(.white, for: .normal)
        button.semanticContentAttribute = .forceRightToLeft
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .heavy)
        button.addTarget(self, action: #selector(moreReviewButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "4.4"
        label.font = .systemFont(ofSize: 57, weight: .heavy)
        label.textColor = .white
        return label
    }()
    
    private let starRatingLabel: UILabel = {
        let label = UILabel()
        label.text = "★ ★ ★ ★ ☆"
        label.font = .systemFont(ofSize: 20, weight: .heavy)
        label.textColor = .white
        return label
    }()
    
    private let totalRatingsLabel: UILabel = {
        let label = UILabel()
        label.text = "8.4만개의 평가"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .lightGray
        return label
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
//        scrollView.isPagingEnabled = true
        return scrollView
    }()
    
    private let reviewStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 15
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let tapToRateLabel: UILabel = {
        let label = UILabel()
        label.text = "탭하여 평가하기"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .white
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
        for _ in 0..<5 {
            reviewStackView.addArrangedSubview(createReviewContentView())
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
    
    private func createReviewContentView() -> UIView {
        let reviewContentView = UIView()
        reviewContentView.backgroundColor = .tertiarySystemGroupedBackground
        reviewContentView.layer.cornerRadius = 15
        reviewContentView.clipsToBounds = true
        
        let reviewTitleLabel = UILabel()
        reviewTitleLabel.text = "토스 UX 전버전으로 해주세요"
        reviewTitleLabel.font = .systemFont(ofSize: 17, weight: .heavy)
        reviewTitleLabel.textColor = .white
        
        let reviewRatingLabel = UILabel()
        reviewRatingLabel.text = "★★★★★"
        reviewRatingLabel.font = .systemFont(ofSize: 13)
        reviewRatingLabel.textColor = .white
        
        let reviewDateLabel = UILabel()
        reviewDateLabel.text = "9월 27일 •"
        reviewDateLabel.font = .systemFont(ofSize: 15)
        reviewDateLabel.textColor = .lightGray
        
        let reviewerLabel = UILabel()
        reviewerLabel.text = "흑 운영자님 ㅠㅠ"
        reviewerLabel.font = .systemFont(ofSize: 15)
        reviewerLabel.textColor = .lightGray
        
        let reviewContentLabel = UILabel()
        reviewContentLabel.text = "최근 업데이트가 토스 만의 ux 색깔 개성자체를\n잃어버린 것 같습니다. 메인 화면 볼때마다 되게\n부드럽고 한눈에 보기 편했는데, 이번 업데이트로\n인해 딱딱해진 것 같네요. 새로움을 지향하는건\n좋으나 이용자들에게 강제가 아닌 선택할 수 있는\n옵션이라도 만들어 주셨으면 어떨까요?"
        reviewContentLabel.font = .systemFont(ofSize: 15)
        reviewContentLabel.numberOfLines = 2
        reviewContentLabel.textColor = .lightGray
        
        let developerLabel = UILabel()
        developerLabel.text = "개발자 답변"
        developerLabel.font = .systemFont(ofSize: 15)
        developerLabel.textColor = .white
        
        let answerDateLabel = UILabel()
        answerDateLabel.text = "9월 29일"
        answerDateLabel.font = .systemFont(ofSize: 15)
        answerDateLabel.textColor = .lightGray
        
        let answerContentLabel = UILabel()
        answerContentLabel.text = "안녕하세요. 토스팀입니다. 소중한 의견을 주셔서\n너무나 감사합니다. 토스 화면 UI를 사용자의 \n요구를 반영해 조금 더 편리하게 사용하도록 변경\n 하였습니다만, 고객님처럼 불편하게 느끼셨을\n수도 있다고 생각합니다. 사용에 불편을 드려 죄송\n합니다.\n고객님께서 말씀해주신 내용은 반영될 수 있다\n확답 드리기는 어려우나, 팀내에 공유하여 보다\n편리한 토스 사용 경험을 하실 수 있도록 노력\n하겠습니다. 다른 문의 사항이 있다면 24시간 운영\n되는 카카오톡(@toss) 또는 고객센터 1599-\n4905로 문의 부탁드립니다. 감사합니다."
        answerContentLabel.numberOfLines = 2
        answerContentLabel.font = .systemFont(ofSize: 15)
        answerContentLabel.textColor = .lightGray
       
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
