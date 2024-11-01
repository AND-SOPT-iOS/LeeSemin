//
//  EssentialApps.swift
//  AND-SOPT-iOS
//
//  Created by 이세민 on 10/30/24.
//

import UIKit

import SnapKit
import Then

class EssentialApps: UIView {
    
    private var appList = FinanceAppList.essentialData
    
    private var essentialFinanceAppsButton: UIButton = {
        let button = UIButton()
        let icon = UIImage(systemName: "chevron.right", withConfiguration: UIImage.SymbolConfiguration(weight: .bold))
        button.setImage(icon, for: .normal)
        button.tintColor = .systemGray
        button.setTitle("필수 금융 앱 ", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.semanticContentAttribute = .forceRightToLeft
        button.titleLabel?.font = UIFont.systemFont(ofSize: 23, weight: .heavy)
        return button
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "App Store 에디터가 직접 골랐습니다"
        label.font = .systemFont(ofSize: 17)
        label.textColor = .lightGray
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
        setCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 80)
        flowLayout.minimumLineSpacing = 0
        
        collectionView.do {
            $0.setCollectionViewLayout(flowLayout, animated: true)
            $0.register(EssentialAppCell.self, forCellWithReuseIdentifier: EssentialAppCell.identifier)
            $0.delegate = self
            $0.dataSource = self
        }
    }
    
    private func setUI() {
        addSubviews(essentialFinanceAppsButton, descriptionLabel, collectionView)
    }
    
    private func setLayout() {
        essentialFinanceAppsButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(essentialFinanceAppsButton.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(20)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(265)
        }
    }
}

extension EssentialApps: UICollectionViewDelegate { }
extension EssentialApps: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: EssentialAppCell.identifier, for: indexPath) as? EssentialAppCell else {
            return UICollectionViewCell()
        }
        
        item.bind(appList[indexPath.item])
        
        let dividerLine = UIView()
        dividerLine.backgroundColor = .systemGray
        
        if indexPath.row % 3 != 2 {
            item.addSubview(dividerLine)
            dividerLine.snp.makeConstraints {
                $0.leading.equalToSuperview().offset(80)
                $0.trailing.equalToSuperview().offset(-20)
                $0.height.equalTo(0.4)
                $0.bottom.equalTo(item)
            }
        }
        
        return item
    }
}
