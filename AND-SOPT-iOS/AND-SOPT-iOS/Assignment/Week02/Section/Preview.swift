//
//  Preview.swift
//  AND-SOPT-iOS
//
//  Created by 이세민 on 10/20/24.
//

import UIKit

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
    
    private var mobileIcon: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "iphone", withConfiguration: UIImage.SymbolConfiguration(weight: .bold)), for: .normal)
        button.tintColor = .systemGray
        return button
    }()
    
    private let mobileLabel: UILabel = {
        let label = UILabel()
        label.text = "iPhone"
        label.font = .systemFont(ofSize: 15 , weight: .heavy)
        label.textColor = .systemGray
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
    
    private func setUI() {
        [titleLabel, imageView, mobileIcon, mobileLabel].forEach {
            view.addSubview($0)
        }
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(20)
            $0.top.equalToSuperview()
        }
        
        imageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(15)
            $0.width.equalTo(240)
            $0.height.equalTo(480)
        }
        
        mobileIcon.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(15)
            $0.leading.equalToSuperview().offset(20)
        }
        
        mobileLabel.snp.makeConstraints {
            $0.leading.equalTo(mobileIcon.snp.trailing).offset(8)
            $0.centerY.equalTo(mobileIcon)
        }
    }
}
