//
//  Preview.swift
//  AND-SOPT-iOS
//
//  Created by 이세민 on 10/20/24.
//

import UIKit

import SnapKit
import Then

class Preview: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "미리 보기"
        label.font = .systemFont(ofSize: 22, weight: .heavy)
        label.textColor = .label
        return label
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    private let imageStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 2
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let iphoneIconLabel: UILabel = {
        let label = UILabel()
        
        let icon = NSTextAttachment()
        icon.image = UIImage(systemName: "iphone")?.withTintColor(.systemGray)
        
        let attributedText = NSMutableAttributedString(attachment: icon)
        attributedText.append(NSAttributedString(string: "   iPhone", attributes: [
            .foregroundColor: UIColor.systemGray,
            .font: UIFont.systemFont(ofSize: 13, weight: .heavy)
        ]))
        
        label.attributedText = attributedText
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
        setImages()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setImages() {
        for i in 1...5 {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "tossPreview\(i).png")
            imageView.contentMode = .scaleAspectFit
            imageView.snp.makeConstraints {
                $0.width.equalTo(240)
                $0.height.equalTo(490)
            }
            imageStackView.addArrangedSubview(imageView)
        }
    }
    
    private func setUI() {
        addSubviews(titleLabel, scrollView, iphoneIconLabel)
        scrollView.addSubview(imageStackView)
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview()
        }
        
        imageStackView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
            $0.height.equalToSuperview()
        }
        
        iphoneIconLabel.snp.makeConstraints {
            $0.top.equalTo(scrollView.snp.bottom).offset(15)
            $0.leading.equalToSuperview().offset(20)
        }
    }
}
