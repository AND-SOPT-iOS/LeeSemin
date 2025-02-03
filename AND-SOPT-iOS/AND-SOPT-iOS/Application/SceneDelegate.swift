//
//  SceneDelegate.swift
//  Seminar-UIKit
//
//  Created by 이세민 on 10/11/24.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)
        //        let navigationController = UINavigationController(rootViewController: TabBarController())
        //        self.window?.rootViewController = navigationController
        
        window?.rootViewController = UIHostingController(rootView: NavigationView { SignUpView() })
        
        self.window?.makeKeyAndVisible()
    }
}

