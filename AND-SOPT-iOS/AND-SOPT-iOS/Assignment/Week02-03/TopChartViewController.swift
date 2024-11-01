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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setUI()
        setLayout()
        setupNavigationBar()
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
        view.addSubviews(tableView)
    }
    
    private func setLayout(){
        
        tableView.snp.makeConstraints{
            $0.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
        }
    }
    
    private func setupNavigationBar(){
        self.navigationItem.title = "인기 차트"
        let rightItem = UIBarButtonItem(title: "금융", style: .plain, target: nil, action: nil)
        navigationItem.rightBarButtonItem = rightItem
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
