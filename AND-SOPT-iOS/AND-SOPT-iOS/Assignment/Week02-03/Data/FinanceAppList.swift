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
    let isRank: Bool
    let rank: Int?
}

extension FinanceAppList {
    static let essentialData: [FinanceAppList] = [
        FinanceAppList(logoImage: UIImage(named: "iFinance 5.png"), title: "iFinance 5", description: "금융", downloadState: "₩29,000", isInAppPurchases: true, isRank: false, rank: nil),
        FinanceAppList(logoImage: UIImage(named: "Money Coach.png"), title: "Money Coach\nBudget Manager Pro", description: "Expense Tracker, Bill Planner", downloadState: "받기", isInAppPurchases: true, isRank: false, rank: nil),
        FinanceAppList(logoImage: UIImage(named: "Finances 2.png"), title: "Finances 2", description: "금융", downloadState: "받기", isInAppPurchases: true, isRank: false, rank: nil),
        FinanceAppList(logoImage: UIImage(named: "MoneyControl.png"), title: "MoneyControl\nSpending Tracker", description: "금융", downloadState: "받기", isInAppPurchases: true, isRank: false, rank: nil),
        FinanceAppList(logoImage: UIImage(named: "YNAB.png"), title: "YNAB", description: "금융", downloadState: "받기", isInAppPurchases: true, isRank: false, rank: nil),
        FinanceAppList(logoImage: UIImage(named: "Splitwise.png"), title: "Splitwise", description: "금융", downloadState: "받기", isInAppPurchases: true, isRank: false, rank: nil),
        FinanceAppList(logoImage: UIImage(named: "Spendy.png"), title: "Spendy - Spendings\nreimagined", description: "금융", downloadState: "₩4,400", isInAppPurchases: false, isRank: false, rank: nil),
        FinanceAppList(logoImage: UIImage(named: "CashCounter.png"), title: "CashCounter: The cash\nmanager", description: "금융", downloadState: "받기", isInAppPurchases: true, isRank: false, rank: nil),
        FinanceAppList(logoImage: UIImage(named: "Macaw.png"), title: "Macaw: Budget & Save\nMoney", description: "금융", downloadState: "받기", isInAppPurchases: true, isRank: false, rank: nil),
    ]
    
    static let topPaidData: [FinanceAppList] = [
        FinanceAppList(logoImage: UIImage(named: "위플 가계부 Pro.png"), title: "위플 가계부 Pro", description: "아이폰 사용자 수 1위 가계부", downloadState: "₩14,000", isInAppPurchases: false, isRank: true, rank: 1),
        FinanceAppList(logoImage: UIImage(named: "편한가계부.png"), title: "편한가계부 (광고\n제거)", description: "국내 1위 가계부", downloadState: "₩8,800", isInAppPurchases: true, isRank: true, rank: 2),
        FinanceAppList(logoImage: UIImage(named: "멤버십 위젯 Pro.png"), title: "멤버십 위젯 Pro", description: "멤버십, 쿠폰, 포인트를\n한번에 빠르게 할인/적립...", downloadState: "₩4,400", isInAppPurchases: true, isRank: true, rank: 3),
        FinanceAppList(logoImage: UIImage(named: "보안카드 위젯.png"), title: "보안카드 위젯", description: "초스피드 계좌이체", downloadState: "₩3,300", isInAppPurchases: true, isRank: true, rank: 4),
        FinanceAppList(logoImage: UIImage(named: "US Debt Clock.png"), title: "US Debt Clock\n.org", description: "금융", downloadState: "₩6,600", isInAppPurchases: false, isRank: true, rank: 5),
        FinanceAppList(logoImage: UIImage(named: "편한 가계부 Classic.png"), title: "편한 가계부 Classic (\n+ PC 가계부 )", description: "금융", downloadState: "₩8,800", isInAppPurchases: false, isRank: true, rank: 6),
        FinanceAppList(logoImage: UIImage(named: "Binance Smart.png"), title: "Binance Smart\nChain Explorer", description: "Track BSC Addresses", downloadState: "₩4,400", isInAppPurchases: true, isRank: true, rank: 7),
        FinanceAppList(logoImage: UIImage(named: "BA Financial Cal.png"), title: "BA Financial\nCalculator (PRO)", description: "금융", downloadState: "₩4,400", isInAppPurchases: false, isRank: true, rank: 8),
        FinanceAppList(logoImage: UIImage(named: "코스트잇.png"), title: "코스트잇", description: "알뜰살뜰 소비 메모장", downloadState: "₩1,100", isInAppPurchases: false, isRank: true, rank: 9),
    ]
    
    static let topFreeData: [FinanceAppList] = [
        FinanceAppList(logoImage: UIImage(named: "실손24.png"), title: "실손24", description: "간편한 실손보험 창구", downloadState: "받기", isInAppPurchases: false, isRank: true, rank: 1),
        FinanceAppList(logoImage: UIImage(named: "네이버페이.png"), title: "네이버페이", description: "지갑없이 매장에서 결제", downloadState: "받기 ", isInAppPurchases: false, isRank: true, rank: 2),
        FinanceAppList(logoImage: UIImage(named: "카카오페이.png"), title: "카카오페이", description: "마음 놓고 금융하다", downloadState: "받기", isInAppPurchases: false, isRank: true, rank: 3),
        FinanceAppList(logoImage: UIImage(named: "NH올원뱅크.png"), title: "NH올원뱅크", description: "금융", downloadState: "받기", isInAppPurchases: false, isRank: true, rank: 4),
        FinanceAppList(logoImage: UIImage(named: "monimo.png"), title: "monimo (모니모, 삼성\n금융네트웍스)", description: "모이는 금융, 커지는 혜택!...", downloadState: "받기", isInAppPurchases: false, isRank: true, rank: 5),
        FinanceAppList(logoImage: UIImage(named: "KB Pay.png"), title: "KB Pay", description: "모든 금융을 한번에, 한손에,\n한눈에 담다", downloadState: "열기", isInAppPurchases: false, isRank: true, rank: 6),
        FinanceAppList(logoImage: UIImage(named: "KB스타뱅킹.png"), title: "KB스타뱅킹", description: "모바일신분증, 결제, 통신도 다\n되는 은행", downloadState: "열기", isInAppPurchases: false, isRank: true, rank: 7),
        FinanceAppList(logoImage: UIImage(named: "하나은행.png"), title: "하나은행, 하나원큐는\n돈기운 가득한 은행 앱", description: "송금, 해외송금, 유학생송금,...", downloadState: "받기", isInAppPurchases: false, isRank: true, rank: 8),
        FinanceAppList(logoImage: UIImage(named: "tossIcon"), title: "토스", description: "금융이 쉬워진다", downloadState: "업데이트", isInAppPurchases: false, isRank: true, rank: 9),
        
        FinanceAppList(logoImage: UIImage(named: "모바일티머니.png"), title: "모바일티머니", description: "금융", downloadState: "열기", isInAppPurchases: false, isRank: true, rank: 10),
        FinanceAppList(logoImage: UIImage(named: "신한 SOL뱅크.png"), title: "신한 SOL뱅크 - \n신한은행 스마트폰•••", description: "금융", downloadState: "열기", isInAppPurchases: false, isRank: true, rank: 11),
        FinanceAppList(logoImage: UIImage(named: "V3.png"), title: "V3 Mobile Plus", description: "코스콤 통합인증 / 알림장\n메세지 서비스", downloadState: "받기", isInAppPurchases: false, isRank: true, rank: 12),
        FinanceAppList(logoImage: UIImage(named: "현대카드.png"), title: "현대카드", description: "금융", downloadState: "받기", isInAppPurchases: false, isRank: true, rank: 13),
        FinanceAppList(logoImage: UIImage(named: "신한 SOL페이.png"), title: "신한 SOL페이 - 신\n한카드 대표 플랫폼", description: "결제부터 자산관리, 다양한...", downloadState: "열기", isInAppPurchases: false, isRank: true, rank: 14),
        FinanceAppList(logoImage: UIImage(named: "트래블월렛.png"), title: "트래블월렛 - travel \nPay", description: "페이에 세계를 담다", downloadState: "받기", isInAppPurchases: false, isRank: true, rank: 15),
        FinanceAppList(logoImage: UIImage(named: "카카오뱅크.png"), title: "카카오뱅크", description: "이미 모두의 은행", downloadState: "열기", isInAppPurchases: false, isRank: true, rank: 16),
        FinanceAppList(logoImage: UIImage(named: "빗썸.png"), title: "빗섬", description: "No.1 가상자산 플랫폼", downloadState: "받기", isInAppPurchases: false, isRank: true, rank: 17),
        FinanceAppList(logoImage: UIImage(named: "우리 WON 뱅킹.png"), title: "우리 WON 뱅킹", description: "금융", downloadState: "받기", isInAppPurchases: false, isRank: true, rank: 18),
        FinanceAppList(logoImage: UIImage(named: "현대백화점.png"), title: "현대백화점", description: "금융", downloadState: "받기", isInAppPurchases: false, isRank: true, rank: 19),
        FinanceAppList(logoImage: UIImage(named: "NH스마트뱅킹.png"), title: "NH스마트뱅킹", description: "한번에 편하게!", downloadState: "받기", isInAppPurchases: false, isRank: true, rank: 20),
    ]
}

