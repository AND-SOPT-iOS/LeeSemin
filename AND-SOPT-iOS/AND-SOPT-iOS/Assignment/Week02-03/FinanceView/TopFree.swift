//
//  TopFree.swift
//  AND-SOPT-iOS
//
//  Created by 이세민 on 10/31/24.
//

import UIKit

import SnapKit
import Then

protocol TopFreeDelegate: AnyObject {
    func didTapTopFreeButton()
    func didTapTossCell()
}

class TopFree: UIView {
    
    weak var delegate: TopFreeDelegate?
    
    private var appList = FinanceAppList.topFreeData
    
    private var topFreeButton: UIButton = {
        let button = UIButton()
        let icon = UIImage(systemName: "chevron.right", withConfiguration: UIImage.SymbolConfiguration(weight: .bold))
        button.setImage(icon, for: .normal)
        button.tintColor = .systemGray
        button.setTitle("무료 순위 ", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.semanticContentAttribute = .forceRightToLeft
        button.titleLabel?.font = UIFont.systemFont(ofSize: 23, weight: .heavy)
        button.addTarget(self, action: #selector(topFreeButtonTapped), for: .touchUpInside)
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
            $0.register(TopPaidFreeAppCell.self, forCellWithReuseIdentifier: TopPaidFreeAppCell.identifier)
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
            $0.top.equalTo(topFreeButton.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(265)
        }
    }
    
    @objc private func topFreeButtonTapped() {
        delegate?.didTapTopFreeButton()
    }
}

extension TopFree: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 8 {
            delegate?.didTapTossCell()
        }
    }
}

extension TopFree: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: TopPaidFreeAppCell.identifier, for: indexPath) as? TopPaidFreeAppCell else {
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
