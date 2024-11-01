//
//  FinanceAppList.swift
//  AND-SOPT-iOS
//
//  Created by 이세민 on 11/1/24.
//

import UIKit

struct FinanceAppList {
    let logoImage: UIImage?
    let title: String
    let description: String
    let downloadState: String
}

extension FinanceAppList {
    static let essentialData: [FinanceAppList] = [
        FinanceAppList(logoImage: UIImage(systemName: "dollarsign.circle"), title: "App 1", description: "Finance App 1", downloadState: "Available"),
        FinanceAppList(logoImage: UIImage(systemName: "dollarsign.circle"), title: "App 2", description: "Finance App 2", downloadState: "Available"),
        FinanceAppList(logoImage: UIImage(systemName: "dollarsign.circle"), title: "App 3", description: "Finance App 3", downloadState: "Available"),
        FinanceAppList(logoImage: UIImage(systemName: "dollarsign.circle"), title: "App 4", description: "Finance App 4", downloadState: "Available"),
        FinanceAppList(logoImage: UIImage(systemName: "dollarsign.circle"), title: "App 5", description: "Finance App 5", downloadState: "Available"),
        FinanceAppList(logoImage: UIImage(systemName: "dollarsign.circle"), title: "App 6", description: "Finance App 6", downloadState: "Available"),
        FinanceAppList(logoImage: UIImage(systemName: "dollarsign.circle"), title: "App 7", description: "Finance App 7", downloadState: "Available"),
        FinanceAppList(logoImage: UIImage(systemName: "dollarsign.circle"), title: "App 8", description: "Finance App 8", downloadState: "Available"),
        FinanceAppList(logoImage: UIImage(systemName: "dollarsign.circle"), title: "App 9", description: "Finance App 9", downloadState: "Available"),
    ]
    
    static let topPaidData: [FinanceAppList] = [
        FinanceAppList(logoImage: UIImage(systemName: "star.fill"), title: "Paid App 1", description: "Top Paid App 1", downloadState: "Available"),
        FinanceAppList(logoImage: UIImage(systemName: "star.fill"), title: "Paid App 2", description: "Top Paid App 2", downloadState: "Available"),
        FinanceAppList(logoImage: UIImage(systemName: "star.fill"), title: "Paid App 3", description: "Top Paid App 3", downloadState: "Available"),
        FinanceAppList(logoImage: UIImage(systemName: "star.fill"), title: "Paid App 4", description: "Top Paid App 4", downloadState: "Available"),
        FinanceAppList(logoImage: UIImage(systemName: "star.fill"), title: "Paid App 5", description: "Top Paid App 5", downloadState: "Available"),
    ]
    
    static let topFreeData: [FinanceAppList] = [
        FinanceAppList(logoImage: UIImage(systemName: "hand.thumbsup"), title: "Free App 1", description: "Top Free App 1", downloadState: "Available"),
        FinanceAppList(logoImage: UIImage(systemName: "hand.thumbsup"), title: "Free App 2", description: "Top Free App 2", downloadState: "Available"),
        FinanceAppList(logoImage: UIImage(systemName: "hand.thumbsup"), title: "Free App 3", description: "Top Free App 3", downloadState: "Available"),
        FinanceAppList(logoImage: UIImage(systemName: "hand.thumbsup"), title: "Free App 4", description: "Top Free App 4", downloadState: "Available"),
        FinanceAppList(logoImage: UIImage(systemName: "hand.thumbsup"), title: "Free App 5", description: "Top Free App 5", downloadState: "Available"),
    ]
}
