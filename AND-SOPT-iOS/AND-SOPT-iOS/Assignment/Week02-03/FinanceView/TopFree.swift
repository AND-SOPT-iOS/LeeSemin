//
//  TopFree.swift
//  AND-SOPT-iOS
//
//  Created by 이세민 on 10/31/24.
//

import UIKit

class TopFree: UIView {
    
    private var appList = FinanceAppList.topFreeData
    
    private var topFreeButton: UIButton = {
        let button = UIButton()
        let icon = UIImage(systemName: "chevron.right", withConfiguration: UIImage.SymbolConfiguration(weight: .bold))
        button.setImage(icon, for: .normal)
        button.tintColor = .systemGray
        button.setTitle("무료 순위 ", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.semanticContentAttribute = .forceRightToLeft
        button.titleLabel?.font = UIFont.systemFont(ofSize: 23, weight: .heavy)
        return button
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
            $0.register(TopPaidFreeCell.self, forCellWithReuseIdentifier: TopPaidFreeCell.identifier)
            $0.delegate = self
            $0.dataSource = self
        }
    }
    
    private func setUI() {
        addSubviews(topFreeButton, collectionView)
    }
    
    private func setLayout() {
        topFreeButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(topFreeButton.snp.bottom).offset(8)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(265)
        }
    }
}

extension TopFree: UICollectionViewDelegate { }
extension TopFree: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: TopPaidFreeCell.identifier, for: indexPath) as? TopPaidFreeCell else {
            return UICollectionViewCell()
        }
        
        item.bind(appList[indexPath.item])
        return item
    }
}