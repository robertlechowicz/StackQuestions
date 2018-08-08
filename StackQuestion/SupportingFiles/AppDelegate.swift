//
//  AppDelegate.swift
//  StackQuestion
//
//  Created by Robert Lechowicz on 06.08.2018.
//  Copyright © 2018 128pixels. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let rootNavigation = UINavigationController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = rootNavigation

        setupAppearance()
        showFirstScreen()
        
        window?.makeKeyAndVisible()
        return true
    }

    func showFirstScreen() {
        let searchViewController = SearchViewController()
        rootNavigation.pushViewController(searchViewController, animated: false)
    }

    private func setupAppearance() {
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().barTintColor = .stackBlue
        UINavigationBar.appearance().barStyle = .blackOpaque
        UINavigationBar.appearance().isTranslucent = false
    }
}

