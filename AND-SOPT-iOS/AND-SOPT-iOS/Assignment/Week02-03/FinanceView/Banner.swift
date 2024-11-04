//
//  Banner.swift
//  AND-SOPT-iOS
//
//  Created by 이세민 on 10/30/24.
//

import UIKit

import SnapKit
import Then

class Banner: UIView {
    
    private let appSubtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .heavy)
        label.textColor = .systemBlue
        return label
    }()
    
    private let appTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22)
        label.textColor = .label
        return label
    }()
    
    private let appDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22)
        label.textColor = .lightGray
        return label
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        return scrollView
    }()
    
    private let imageStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 25
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
        setImages()
        
        scrollView.delegate = self
        updateLabels(for: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setImages() {
        for bannerData in BannerData.mockData {
            let imageView = UIImageView()
            imageView.image = UIImage(named: bannerData.appBannerImage)
            imageView.contentMode = .scaleToFill
            imageView.layer.cornerRadius = 8
            imageView.clipsToBounds = true
            imageView.snp.makeConstraints {
                $0.width.equalTo(350)
                $0.height.equalTo(230)
            }
            imageStackView.addArrangedSubview(imageView)
        }
    }
    
    private func setUI() {
        addSubviews(appSubtitleLabel, appTitleLabel, appDescriptionLabel, scrollView)
        scrollView.addSubview(imageStackView)
    }
    
    private func setLayout() {
        appSubtitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
        }
        
        appTitleLabel.snp.makeConstraints {
            $0.top.equalTo(appSubtitleLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(20)
        }
        
        appDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(appTitleLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(20)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(appDescriptionLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
        }
        
        imageStackView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
            $0.height.equalToSuperview()
        }
    }
    
    private func updateLabels(for index: Int) {
        let bannerData = BannerData.mockData[index]
        appSubtitleLabel.text = bannerData.appSubtitle
        appTitleLabel.text = bannerData.appTitle
        appDescriptionLabel.text = bannerData.appDescription
    }
}

extension Banner: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / scrollView.frame.width)
        let index = Int(pageIndex)
        
        if index >= 0 && index < BannerData.mockData.count {
            updateLabels(for: index)
        }
    }
}
