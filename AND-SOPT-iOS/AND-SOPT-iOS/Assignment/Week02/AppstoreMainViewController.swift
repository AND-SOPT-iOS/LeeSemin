//
//  AppstoreMainViewController.swift
//  AND-SOPT-iOS
//
//  Created by 이세민 on 10/22/24.
//

import UIKit

class AppstoreMainViewController: UIViewController {

    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let appIntro = AppIntro()
    private let appInfo = AppInfo()
    private let whatsNew = WhatsNew()
    private let preview = Preview()
    private let developerInfo = DeveloperInfo()
    private let review = Review()
    
    private var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "chevron.left", withConfiguration: UIImage.SymbolConfiguration(weight: .bold)), for: .normal)
        button.tintColor = .systemBlue
        return button
    }()
    
    private let backLabel: UILabel = {
        let label = UILabel()
        label.text = "앱"
        label.font = .systemFont(ofSize: 18)
        label.textColor = .systemBlue
        return label
    }()
    
    private func createDividerLine() -> UIView {
        let view = UIView()
        view.backgroundColor = .systemGray
        return view
    }
    
    private lazy var divider1: UIView = createDividerLine()
    private lazy var divider2: UIView = createDividerLine()
    private lazy var divider3: UIView = createDividerLine()
    private lazy var divider4: UIView = createDividerLine()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setUI()
        setLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("AppIntroView Height: \(appIntro.view.frame.height)")
    }
    
    private func setStyle() {
        self.view.backgroundColor = .black
    }
    
    private func setUI() {
        view.addSubview(backButton)
        view.addSubview(backLabel)
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(appIntro.view)
        contentView.addSubview(divider1)
        contentView.addSubview(appInfo.view)
        contentView.addSubview(divider2)
        contentView.addSubview(whatsNew.view)
        contentView.addSubview(divider3)
        contentView.addSubview(preview.view)
        contentView.addSubview(developerInfo.view)
        contentView.addSubview(divider4)
        contentView.addSubview(review.view)
    }
    
    
    private func setLayout() {
        backButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(60)
            $0.leading.equalToSuperview().offset(10)
        }
        
        backLabel.snp.makeConstraints {
            $0.leading.equalTo(backButton.snp.trailing).offset(5)
            $0.centerY.equalTo(backButton)
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
            $0.top.equalToSuperview().offset(5)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(120)
        }
        
        divider1.snp.makeConstraints {
            $0.top.equalTo(appIntro.view.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(0.3)
        }
        
        appInfo.view.snp.makeConstraints {
            $0.top.equalTo(divider1.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(70)
        }
        
        divider2.snp.makeConstraints {
            $0.top.equalTo(appInfo.view.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(0.3)
        }
        
        whatsNew.view.snp.makeConstraints {
            $0.top.equalTo(divider2.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(150)
        }
        
        preview.view.snp.makeConstraints {
            $0.top.equalTo(whatsNew.view.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(570)
        }
        
        divider3.snp.makeConstraints {
            $0.top.equalTo(preview.view.snp.bottom).offset(15)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(0.3)
        }
        
        developerInfo.view.snp.makeConstraints{
            $0.top.equalTo(divider3.snp.bottom).offset(15)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(130)
        }
        
        divider4.snp.makeConstraints {
            $0.top.equalTo(developerInfo.view.snp.bottom).offset(15)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(0.3)
        }
        
        review.view.snp.makeConstraints{
            $0.top.equalTo(divider4.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(480)
            $0.bottom.equalToSuperview()
        }
    
        
    }
}
