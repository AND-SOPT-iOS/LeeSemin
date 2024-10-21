//
//  Review.swift
//  AND-SOPT-iOS
//
//  Created by 이세민 on 10/21/24.
//

import UIKit

class Review: UIViewController {
    
    private let reviewButton: UIButton = {
        let button = UIButton()
        let icon = UIImage(systemName: "chevron.right", withConfiguration: UIImage.SymbolConfiguration(weight: .bold))
        button.setImage(icon, for: .normal)
        button.tintColor = .systemGray
        button.setTitle("평가 및 리뷰 ", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.semanticContentAttribute = .forceRightToLeft
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .heavy)
        return button
    }()
    
    private let ratingsLabel: UILabel = {
        let label = UILabel()
        label.text = "4.4"
        label.font = .systemFont(ofSize: 55, weight: .heavy)
        label.textColor = .white
        return label
    }()
    
    private let totalRatingsLabel: UILabel = {
        let label = UILabel()
        label.text = "★ ★ ★ ★ ★ \n8.4만개의 평가"
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18)
        label.textColor = .lightGray
        return label
    }()
    
    private let mostHelpfulReviewLabel: UILabel = {
        let label = UILabel()
        label.text = "가장 도움이 되는 리뷰"
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .white
        return label
    }()
    
    private let reviewContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .tertiarySystemGroupedBackground
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        return view
    }()
    
    private let reviewTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "토스 UX 전버전으로 해주세요"
        label.font = .systemFont(ofSize: 16, weight: .heavy)
        label.textColor = .white
        return label
    }()
    
    private let reviewRatingLabel: UILabel = {
        let label = UILabel()
        label.text = "★★★★★"
        label.font = .systemFont(ofSize: 13)
        label.textColor = .white
        return label
    }()
    
    private let reviewDateLabel: UILabel = {
        let label = UILabel()
        label.text = "9월 27일 •"
        label.font = .systemFont(ofSize: 15)
        label.textColor = .lightGray
        return label
    }()
    
    private let reviewerLabel: UILabel = {
        let label = UILabel()
        label.text = "흑 운영자님 ㅠㅠ"
        label.font = .systemFont(ofSize: 15)
        label.textColor = .lightGray
        return label
    }()
    
    private let reviewContentLabel: UILabel = {
        let label = UILabel()
        label.text = "최근 업데이트가 토스 만의 ux 색깔 개성자체를\n잃어버린 것 같습니다. 메인 화면 볼때마다 되게\n부드럽고 한눈에 보기 편했는데, 이번 업데이트로\n인해 딱딱해진 것 같네요. 새로움을 지향하는건\n좋으나 이용자들에게 강제가 아닌 선택할 수 있는\n옵션이라도 만들어 주셨으면 어떨까요?"
        label.font = .systemFont(ofSize: 15)
        label.numberOfLines = 2
        label.textColor = .lightGray
        return label
    }()
    
    private let developerLabel: UILabel = {
        let label = UILabel()
        label.text = "개발자 답변"
        label.font = .systemFont(ofSize: 15)
        label.textColor = .white
        return label
    }()
    
    private let answerDateLabel: UILabel = {
        let label = UILabel()
        label.text = "9월 29일"
        label.font = .systemFont(ofSize: 15)
        label.textColor = .lightGray
        return label
    }()
    
    private let answerContentLabel: UILabel = {
        let label = UILabel()
        label.text = "안녕하세요. 토스팀입니다. 소중한 의견을 주셔서\n너무나 감사합니다. 토스 화면 UI를 사용자의 \n요구를 반영해 조금 더 편리하게 사용하도록 변경\n 하였습니다만, 고객님처럼 불편하게 느끼셨을\n수도 있다고 생각합니다. 사용에 불편을 드려 죄송\n합니다.\n고객님께서 말씀해주신 내용은 반영될 수 있다\n확답 드리기는 어려우나, 팀내에 공유하여 보다\n편리한 토스 사용 경험을 하실 수 있도록 노력\n하겠습니다. 다른 문의 사항이 있다면 24시간 운영\n되는 카카오톡(@toss) 또는 고객센터 1599-\n4905로 문의 부탁드립니다. 감사합니다."
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 15)
        label.textColor = .lightGray
        return label
    }()
    
    private let tapToRateLabel: UILabel = {
        let label = UILabel()
        label.text = "탭하여 평가하기"
        label.font = .systemFont(ofSize: 18)
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
    
    private func createButton(title: String, iconName: String) -> UIButton {
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
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        return button
    }
    
    private lazy var writeReviewButton: UIButton = createButton(title: "리뷰 작성", iconName: "square.and.pencil")
    
    private lazy var appSupportButton: UIButton = createButton(title: "앱 지원", iconName: "questionmark.circle")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
    
    private func setUI() {
        [reviewButton, ratingsLabel, totalRatingsLabel, mostHelpfulReviewLabel, reviewContentView, reviewTitleLabel, reviewRatingLabel, reviewDateLabel, reviewerLabel, reviewContentLabel, developerLabel, answerDateLabel, answerContentLabel, tapToRateLabel, starStackView, writeReviewButton, appSupportButton].forEach {
            view.addSubview($0)
        }
    }
    
    private func setLayout() {
        reviewButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
        }
        
        ratingsLabel.snp.makeConstraints {
            $0.top.equalTo(reviewButton.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(20)
        }
        
        totalRatingsLabel.snp.makeConstraints{
            $0.trailing.equalToSuperview().offset(-20)
            $0.centerY.equalTo(ratingsLabel)
        }
        
        mostHelpfulReviewLabel.snp.makeConstraints{
            $0.top.equalTo(ratingsLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(20)
        }
        
        reviewContentView.snp.makeConstraints {
            $0.top.equalTo(mostHelpfulReviewLabel.snp.bottom).offset(15)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(345)
            $0.height.equalTo(200)
        }
        
        reviewTitleLabel.snp.makeConstraints{
            $0.top.equalTo(mostHelpfulReviewLabel.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(50)
        }
        
        reviewRatingLabel.snp.makeConstraints{
            $0.top.equalTo(reviewTitleLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(50)
        }
        
        reviewDateLabel.snp.makeConstraints{
            $0.leading.equalTo(reviewRatingLabel.snp.trailing).offset(5)
            $0.centerY.equalTo(reviewRatingLabel)
        }
        
        reviewerLabel.snp.makeConstraints{
            $0.leading.equalTo(reviewDateLabel.snp.trailing).offset(5)
            $0.centerY.equalTo(reviewRatingLabel)
        }
        
        reviewContentLabel.snp.makeConstraints{
            $0.top.equalTo(reviewRatingLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(50)
        }
        
        developerLabel.snp.makeConstraints{
            $0.top.equalTo(reviewContentLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(50)
        }
        
        answerDateLabel.snp.makeConstraints{
            $0.leading.equalTo(developerLabel.snp.trailing).offset(5)
            $0.centerY.equalTo(developerLabel)
        }
        
        answerContentLabel.snp.makeConstraints{
            $0.top.equalTo(developerLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(50)
        }
        
        
        tapToRateLabel.snp.makeConstraints {
            $0.top.equalTo(reviewContentView.snp.bottom).offset(15)
            $0.centerX.equalToSuperview()
        }
        
        //        starStackView.snp.makeConstraints {
        //            $0.centerX.equalToSuperview()
        //            $0.top.equalTo(tapToRateLabel.snp.bottom).offset(5)
        //            $0.width.equalTo(200)
        //        }
        
        writeReviewButton.snp.makeConstraints {
            $0.top.equalTo(tapToRateLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(40)
            $0.width.equalTo(150)
            $0.height.equalTo(50)
        }
        
        appSupportButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-40)
            $0.centerY.equalTo(writeReviewButton)
            $0.width.equalTo(150)
            $0.height.equalTo(50)
        }
    }
    
}
