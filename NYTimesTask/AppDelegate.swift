//
//  AppDelegate.swift
//  NYTimesTask
//
//  Created by Hassan on 12/7/20.
//  Copyright © 2020 Hassan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        initWindow()
        window?.rootViewController = NYTimesListMaker.make()
        
        
        return true
    }

    
    
    private func initWindow() -> Void {
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
    }


}

