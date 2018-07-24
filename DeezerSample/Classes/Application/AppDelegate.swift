//
//  AppDelegate.swift
//  DeezerSample
//
//  Created by cpo on 01/07/2018.
//  Copyright © 2018 CPO. All rights reserved.
//

import UIKit

let Router = RouterManager()

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  /*******************************************************************************/
  // MARK: - Properties
  
  var window: UIWindow?
  private let userIdentifier: Int = 5
  
  /*******************************************************************************/
  // MARK: - UIApplicationDelegate
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

    self.window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = UIViewController()
    window?.makeKeyAndVisible()
    
    Router.presentPlaylistsViewController(forUserIdentifier: self.userIdentifier)
    
    return true
  }
}

