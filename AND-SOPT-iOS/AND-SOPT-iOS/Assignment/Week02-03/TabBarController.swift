//
//  TabBarController.swift
//  AND-SOPT-iOS
//
//  Created by 이세민 on 11/8/24.
//

import UIKit

class TabBarController: UITabBarController {
    enum Tab: Int, CaseIterable {
        case finance
        case server
        
        var title: String {
            switch self {
            case .finance: return "금융"
            case .server: return "서버"
            }
        }
        
        var image: UIImage? {
            switch self {
            case .finance: return UIImage(systemName: "banknote")
            case .server: return UIImage(systemName: "server.rack")
            }
        }
        
        var viewController: UIViewController {
            switch self {
            case .finance: return UINavigationController(rootViewController: FinanceViewController())
            case .server: return UINavigationController(rootViewController: LoginViewController())
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
    }
    
    private func setupTabBar() {
        tabBar.isTranslucent = false
        
        viewControllers = Tab.allCases.map { tab in
            let viewController = tab.viewController
            viewController.tabBarItem = UITabBarItem(title: tab.title, image: tab.image, tag: tab.rawValue)
            return viewController
        }
    }
}
