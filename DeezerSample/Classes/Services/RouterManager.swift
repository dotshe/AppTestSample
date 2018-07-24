//
//  RouterManager.swift
//  DeezerSample
//
//  Created by cpo on 24/07/2018.
//  Copyright © 2018 CPO. All rights reserved.
//

import UIKit

class RouterManager {
  
  /*******************************************************************************/
  // MARK: - Properties
  
  private var currentViewController: UIViewController?
  
  /*******************************************************************************/
  // MARK: - ViewControllers
  
  /**
   * Gets a playlists view controller for a user identifier
   */
  func playlistsViewController(forUserIdentifier userIdentifier: Int) -> PlaylistsViewController {
    let viewController: PlaylistsViewController = PlaylistsViewController()
    viewController.playlistsViewModel = PlaylistsViewModel(withUserIdentifier: userIdentifier)
    return viewController
  }
  
  /**
   * Gets a playlist detail view controller for a playlist identifier
   */
  func playlistDetailViewController(forPlaylistIdentifier playlistIdentifier: Int) -> PlaylistDetailViewController {
    let viewController: PlaylistDetailViewController = PlaylistDetailViewController()
    viewController.modalTransitionStyle = .crossDissolve
    viewController.tracksViewModel = TracksViewModel(withPlaylistIdentifier: playlistIdentifier)
    return viewController
  }
  
  /*******************************************************************************/
  // MARK: - Navigation - Generic
  
  /**
   *
   */
  private func presentViewController(_ viewController: UIViewController) {
    if let topVisibleViewController = UIApplication.shared.keyWindow?.rootViewController?.topVisibleViewController {
      topVisibleViewController.present(viewController, animated: true, completion: nil)
    }
  }
  
  /**
   *
   */
  private func pushViewController(_ viewController: UIViewController) {
    if let topVisibleViewController = UIApplication.shared.keyWindow?.rootViewController?.topVisibleViewController {
      topVisibleViewController.show(viewController, sender: nil)
    }
  }
  
  /*******************************************************************************/
  // MARK: - Navigation - Playlists
  
  /**
   *
   */
  func presentPlaylistsViewController(forUserIdentifier userIdentifier: Int) {
    let viewController = self.playlistsViewController(forUserIdentifier: userIdentifier)
    let navigationController = UINavigationController(rootViewController: viewController)
    navigationController.setNavigationBarHidden(true, animated: false)
    presentViewController(navigationController)
  }
  
  /**
   *
   */
  func presentPlaylistDetailViewController(forPlaylistIdentifier playlistIdentifier: Int) {
    let viewController = self.playlistDetailViewController(forPlaylistIdentifier: playlistIdentifier)
    presentViewController(viewController)
  }
}

/*******************************************************************************/
// MARK: -

public extension UIViewController {
  
  var topVisibleViewController: UIViewController? {
    guard let presentedViewController = self.presentedViewController else {
      return self
    }
    
    // Manage NavigationController
    if let navigationController = self.presentedViewController as? UINavigationController {
      if let visibleViewController = navigationController.visibleViewController {
        return visibleViewController.topVisibleViewController
      }
      return navigationController.topVisibleViewController
    }
    
    // Manage TabBarController
    if let tabBarController = self.presentedViewController as? UITabBarController {
      if let selectedViewController = tabBarController.selectedViewController {
        return selectedViewController.topVisibleViewController
      }
      return tabBarController.topVisibleViewController
    }
    
    return presentedViewController.topVisibleViewController
  }
}

