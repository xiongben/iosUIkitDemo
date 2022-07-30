//
//  AppDelegate.swift
//  LimitInputTextField
//
//  Created by admin on 2022/7/28.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // 建立一個 UIWindow
                self.window = UIWindow(frame: UIScreen.main.bounds)

                // 設置底色
                self.window!.backgroundColor = UIColor.white
                
                // 設置根視圖控制器
                let nav = UINavigationController(rootViewController: ViewController())
                self.window!.rootViewController = nav
                
                // 將 UIWindow 設置為可見的
                self.window!.makeKeyAndVisible()
                
                return true
    }

//    // MARK: UISceneSession Lifecycle
//
//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }


}

