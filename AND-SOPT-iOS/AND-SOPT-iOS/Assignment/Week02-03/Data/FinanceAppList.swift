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
    let isInAppPurchases: Bool
}

extension FinanceAppList {
    static let essentialData: [FinanceAppList] = [
        FinanceAppList(logoImage: UIImage(named: "iFinance 5.png"), title: "iFinance 5", description: "금융", downloadState: "₩29,000", isInAppPurchases: true),
        FinanceAppList(logoImage: UIImage(named: "Money Coach.png"), title: "Money Coach\nBudget Manager Pro", description: "Expense Tracker, Bill Planner", downloadState: "받기", isInAppPurchases: true),
        FinanceAppList(logoImage: UIImage(named: "Finances 2.png"), title: "Finances 2", description: "금융", downloadState: "받기", isInAppPurchases: true),
        FinanceAppList(logoImage: UIImage(named: "MoneyControl.png"), title: "MoneyControl\nSpending Tracker", description: "금융", downloadState: "받기", isInAppPurchases: true),
        FinanceAppList(logoImage: UIImage(named: "YNAB.png"), title: "YNAB", description: "금융", downloadState: "받기", isInAppPurchases: true),
        FinanceAppList(logoImage: UIImage(named: "Splitwise.png"), title: "Splitwise", description: "금융", downloadState: "받기", isInAppPurchases: true),
        FinanceAppList(logoImage: UIImage(named: "Spendy.png"), title: "Spendy - Spendings\nreimagined", description: "금융", downloadState: "₩4,400", isInAppPurchases: false),
        FinanceAppList(logoImage: UIImage(named: "CashCounter.png"), title: "CashCounter: The cash\nmanager", description: "금융", downloadState: "받기", isInAppPurchases: true),
        FinanceAppList(logoImage: UIImage(named: "Macaw.png"), title: "Macaw: Budget & Save\nMoney", description: "금융", downloadState: "받기", isInAppPurchases: true),
    ]
    
    static let topPaidData: [FinanceAppList] = [
        FinanceAppList(logoImage: UIImage(systemName: "star.fill"), title: "Paid App 1", description: "Top Paid App 1", downloadState: "Available", isInAppPurchases: false),
        FinanceAppList(logoImage: UIImage(systemName: "star.fill"), title: "Paid App 2", description: "Top Paid App 2", downloadState: "Available", isInAppPurchases: false),
        FinanceAppList(logoImage: UIImage(systemName: "star.fill"), title: "Paid App 3", description: "Top Paid App 3", downloadState: "Available", isInAppPurchases: false),
        FinanceAppList(logoImage: UIImage(systemName: "star.fill"), title: "Paid App 4", description: "Top Paid App 4", downloadState: "Available", isInAppPurchases: false),
        FinanceAppList(logoImage: UIImage(systemName: "star.fill"), title: "Paid App 5", description: "Top Paid App 5", downloadState: "Available", isInAppPurchases: false),
    ]
    
    static let topFreeData: [FinanceAppList] = [
        FinanceAppList(logoImage: UIImage(systemName: "hand.thumbsup"), title: "Free App 1", description: "Top Free App 1", downloadState: "Available", isInAppPurchases: false),
        FinanceAppList(logoImage: UIImage(systemName: "hand.thumbsup"), title: "Free App 2", description: "Top Free App 2", downloadState: "Available", isInAppPurchases: false),
        FinanceAppList(logoImage: UIImage(systemName: "hand.thumbsup"), title: "Free App 3", description: "Top Free App 3", downloadState: "Available", isInAppPurchases: false),
        FinanceAppList(logoImage: UIImage(systemName: "hand.thumbsup"), title: "Free App 4", description: "Top Free App 4", downloadState: "Available", isInAppPurchases: false),
        FinanceAppList(logoImage: UIImage(systemName: "hand.thumbsup"), title: "Free App 5", description: "Top Free App 5", downloadState: "Available", isInAppPurchases: false),
    ]
}

