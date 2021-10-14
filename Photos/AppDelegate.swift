//
//  AppDelegate.swift
//  Photos
//
//  Created by Admin on 13.10.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.rootViewController = MainCoordinator().start()
        window?.makeKeyAndVisible()
        return true
    }

}

