//
//  AppstoreMainViewController.swift
//  AND-SOPT-iOS
//
//  Created by 이세민 on 10/22/24.
//

import UIKit
import SnapKit

class AppstoreMainViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let appIntro = AppIntro()
    private let appInfo = AppInfo()
    private let whatsNew = WhatsNew()
    private let preview = Preview()
    private let developerInfo = DeveloperInfo()
    private let review = Review()
    
    private let backButton: UIButton = {
        let button = UIButton()
        let icon = UIImage(systemName: "chevron.left", withConfiguration: UIImage.SymbolConfiguration(weight: .bold))
        button.setImage(icon, for: .normal)
        button.setTitle(" 앱", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.semanticContentAttribute = .forceLeftToRight
        return button
    }()
    
    private func createDividerLine() -> UIView {
        let view = UIView()
        view.backgroundColor = .systemGray
        return view
    }
    
    private lazy var firstDividerLine: UIView = createDividerLine()
    private lazy var secondDividerLine: UIView = createDividerLine()
    private lazy var thirdDividerLine: UIView = createDividerLine()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setUI()
        setLayout()
    }
    
    private func setStyle() {
        self.view.backgroundColor = .black
    }
    
    private func setUI() {
        [backButton, scrollView].forEach {
            view.addSubview($0)
        }
        
        scrollView.addSubview(contentView)
        
        [appIntro.view, firstDividerLine, appInfo.view, secondDividerLine, whatsNew.view, thirdDividerLine, preview.view, developerInfo.view, review.view].forEach {
            contentView.addSubview($0)
        }
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
        
        appIntro.view.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(120)
        }
        
        firstDividerLine.snp.makeConstraints {
            $0.top.equalTo(appIntro.view.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(0.3)
        }
        
        appInfo.view.snp.makeConstraints {
            $0.top.equalTo(firstDividerLine.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(70)
        }
        
        secondDividerLine.snp.makeConstraints {
            $0.top.equalTo(appInfo.view.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(0.3)
        }
        
        whatsNew.view.snp.makeConstraints {
            $0.top.equalTo(secondDividerLine.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(150)
        }
        
        preview.view.snp.makeConstraints {
            $0.top.equalTo(whatsNew.view.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(565)
        }
        
        thirdDividerLine.snp.makeConstraints {
            $0.top.equalTo(preview.view.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(0.3)
        }
        
        developerInfo.view.snp.makeConstraints{
            $0.top.equalTo(thirdDividerLine.snp.bottom).offset(15)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(130)
        }
        
        review.view.snp.makeConstraints{
            $0.top.equalTo(developerInfo.view.snp.bottom).offset(50)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(480)
            $0.bottom.equalToSuperview()
        }
    }
}