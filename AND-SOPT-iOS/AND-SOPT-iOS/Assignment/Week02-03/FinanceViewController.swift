//
//  FinanceViewController.swift
//  AND-SOPT-iOS
//
//  Created by 이세민 on 10/30/24.
//

import UIKit

class FinanceViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let banner = Banner()
    private let essentialApps = EssentialApps()
    
    private let backButton: UIButton = {
        let button = UIButton()
        let icon = UIImage(systemName: "chevron.left", withConfiguration: UIImage.SymbolConfiguration(weight: .bold))
        button.setImage(icon, for: .normal)
        button.setTitle(" 앱", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.semanticContentAttribute = .forceLeftToRight
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setUI()
        setLayout()
    }
    
    private func setStyle() {
        self.view.backgroundColor = UIColor.systemBackground
    }
    
    private func setUI() {
        view.addSubviews(backButton, scrollView)
        
        scrollView.addSubview(contentView)
        
        contentView.addSubviews(banner, essentialApps)
    }
    
    private func setLayout() {
        backButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(60)
            $0.leading.equalToSuperview().offset(10)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.left.right.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(scrollView)
            $0.height.greaterThanOrEqualToSuperview().priority(.low)
        }
        
        banner.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(360)
        }
        
        essentialApps.snp.makeConstraints {
            $0.top.equalTo(banner.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(280)
        }
    }
}
