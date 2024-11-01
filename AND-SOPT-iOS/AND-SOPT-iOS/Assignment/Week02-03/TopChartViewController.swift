//
//  TopChartViewController.swift
//  AND-SOPT-iOS
//
//  Created by 이세민 on 10/31/24.
//

import UIKit

class TopChartViewController: UIViewController {
    
    private let tableView = UITableView()
    private let appList = FinanceAppList.topFreeData
    
    private let backButton: UIButton = {
        let button = UIButton()
        let icon = UIImage(systemName: "chevron.left", withConfiguration: UIImage.SymbolConfiguration(weight: .bold))
        button.setImage(icon, for: .normal)
        button.setTitle(" 금융", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.semanticContentAttribute = .forceLeftToRight
        return button
    }()
    
    private let topChartsLabel: UILabel = {
        let label = UILabel()
        label.text = "인기 차트"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .label
        return label
    }()
    
    private let financeLabel: UILabel = {
        let label = UILabel()
        label.text = "금융"
        label.font = .systemFont(ofSize: 17)
        label.textColor = .systemBlue
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setUI()
        setLayout()
    }
    
    private func setStyle() {
        tableView.do{
            $0.register(TopChartCell.self,
                        forCellReuseIdentifier: TopChartCell.identifier)
            $0.rowHeight = 90
            $0.dataSource = self
        }
    }
    
    private func setUI() {
        view.addSubviews(backButton, topChartsLabel, financeLabel, tableView)
    }
    
    private func setLayout(){
        backButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(60)
            $0.leading.equalToSuperview().offset(10)
        }
        
        topChartsLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalTo(backButton)
        }
        
        financeLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-20)
            $0.centerY.equalTo(topChartsLabel)
        }
        
        tableView.snp.makeConstraints{
            $0.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
        }
    }
}

extension TopChartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appList.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: TopChartCell.identifier,
            for: indexPath
        ) as? TopChartCell else { return UITableViewCell() }
        cell.configure(appList[indexPath.item])
        
        let dividerLine = UIView()
        dividerLine.backgroundColor = .systemGray
        
        if indexPath.row != 0 {
            cell.addSubview(dividerLine)
            dividerLine.snp.makeConstraints {
                $0.leading.equalToSuperview().offset(20)
                $0.trailing.equalToSuperview().offset(-20)
                $0.height.equalTo(0.4)
                $0.bottom.equalTo(cell)
            }
        }
        
        return cell
    }
}
