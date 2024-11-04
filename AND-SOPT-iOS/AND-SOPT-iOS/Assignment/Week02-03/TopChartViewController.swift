//
//  TopChartViewController.swift
//  AND-SOPT-iOS
//
//  Created by 이세민 on 10/31/24.
//

import UIKit

import SnapKit
import Then

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
            $0.delegate = self
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

extension TopChartViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if appList[indexPath.row].title == "토스" {
            let appStoreTossVC = AppStoreTossViewController()
            self.navigationController?.pushViewController(appStoreTossVC, animated: true)
            self.navigationItem.backButtonTitle = "금융"
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
        
        
        cell.addSubview(dividerLine)
        dividerLine.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(85)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(0.4)
            $0.bottom.equalTo(cell)
        }
        
        return cell
    }
}
