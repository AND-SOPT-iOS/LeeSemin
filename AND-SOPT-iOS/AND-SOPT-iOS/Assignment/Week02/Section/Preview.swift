//
//  Preview.swift
//  AND-SOPT-iOS
//
//  Created by 이세민 on 10/20/24.
//

import UIKit
import SnapKit

class Preview: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "미리 보기"
        label.font = .systemFont(ofSize: 22, weight: .heavy)
        label.textColor = .white
        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "toss_preview.png")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let iphoneIconLabel: UILabel = {
        let label = UILabel()
        
        let iconAttachment = NSTextAttachment()
        iconAttachment.image = UIImage(systemName: "iphone")?.withTintColor(.systemGray)
        
        let attributedText = NSMutableAttributedString(attachment: iconAttachment)
        attributedText.append(NSAttributedString(string: "   iPhone", attributes: [
            .foregroundColor: UIColor.systemGray,
            .font: UIFont.systemFont(ofSize: 13, weight: .heavy)
        ]))
        
        label.attributedText = attributedText
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
    
    private func setUI() {
        [titleLabel, imageView, iphoneIconLabel].forEach {
            view.addSubview($0)
        }
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
        }
        
        imageView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(15)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(240)
            $0.height.equalTo(480)
        }
        
        iphoneIconLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(15)
            $0.leading.equalToSuperview().offset(20)
        }
    }
}
