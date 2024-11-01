//
//  BannerData.swift
//  AND-SOPT-iOS
//
//  Created by 이세민 on 10/31/24.
//

import Foundation

struct BannerData {
    let appSubtitle: String
    let appTitle: String
    let appDescription: String
    let appBannerImage: String
}

extension BannerData {
    static let mockData: [BannerData] = [
        BannerData(appSubtitle: "추천",
                   appTitle: "Currenzy",
                   appDescription: "빠르고 쉬운 환율 계산",
                   appBannerImage: "appBannerImage1"),
        BannerData(appSubtitle: "새로운 경험",
                   appTitle: "Fortune City - A Finance App",
                   appDescription: "게임을 하듯 관리하는 가계부",
                   appBannerImage: "appBannerImage2"),
        BannerData(appSubtitle: "새로운 앱",
                   appTitle: "Elk - 여행 환율 변환기",
                   appDescription: "언제 어디서나 간편한 환율 체크",
                   appBannerImage: "appBannerImage3"),
        BannerData(appSubtitle: "추천",
                   appTitle: "Taxnote 부기 및 회계 앱",
                   appDescription: "간편한 장부 관리",
                   appBannerImage: "appBannerImage4"),
    ]
}
