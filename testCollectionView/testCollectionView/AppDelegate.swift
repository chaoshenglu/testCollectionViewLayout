//
//  AppDelegate.swift
//  testCollectionView
//
//  Created by lixiang on 2017/12/16.
//  Copyright © 2017年 lixiang. All rights reserved.
//

import UIKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let nav = UINavigationController(rootViewController:ViewController())
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        return true
    }
}

