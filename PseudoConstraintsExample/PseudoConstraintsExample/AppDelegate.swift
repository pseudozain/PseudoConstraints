//
//  AppDelegate.swift
//  PseudoConstraintsExample
//
//  Created by Zain on 01/07/2020.
//  Copyright © 2020 PseudoLabs. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let viewController = ViewController()
        
        let navigationController = UINavigationController(rootViewController: viewController)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        
        window?.makeKeyAndVisible()
        
        return true
    }
    
}

