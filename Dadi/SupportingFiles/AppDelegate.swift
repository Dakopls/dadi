//
//  AppDelegate.swift
//  Dadi
//
//  Created by Dídac Serrano i Segarra on 10/08/2020.
//  Copyright © 2020 Dídac Serrano i Segarra. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        let wireframe = AuthenticationWireframe()
        window?.rootViewController = wireframe.entry
//        let vc = UIViewController()
//        vc.view.backgroundColor = .red
//        window?.rootViewController = vc
        
        //Make this scene's window visible
        window?.makeKeyAndVisible()
        return true
    }
}
