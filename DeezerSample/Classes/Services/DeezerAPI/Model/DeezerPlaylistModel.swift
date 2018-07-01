//
//  DeezerPlaylistModel.swift
//  DeezerSample
//
//  Created by cpo on 01/07/2018.
//  Copyright © 2018 CPO. All rights reserved.
//

import Foundation

class DeezerPlaylistModel: PlaylistModel {
  
  /*******************************************************************************/
  // MARK: - Constants & Enums
  
  /// Keys from Deezer's API for a playlist
  struct APIKeys {
    static let identifier     = "id"
    static let title          = "title"
    static let duration       = "duration"
    static let pictureMedium  = "picture_medium"
    static let pictureBig     = "picture_big"
  }
  
  /*******************************************************************************/
  // MARK: - Properties
  
  let identifier: Int
  let title: String
  let duration: TimeInterval
  var pictureMediumUrl: URL? = nil
  var pictureBigUrl: URL? = nil
  
  /*******************************************************************************/
  // MARK: - Birth and Death
  
  init?(json: [String: Any]) {
    // Required properties
    guard let identifier = json[APIKeys.identifier] as? Int else { return nil }
    guard let title = json[APIKeys.title] as? String else { return nil }
    guard let duration = json[APIKeys.duration] as? Double else { return nil }
    
    self.identifier = identifier
    self.title = title
    self.duration = TimeInterval(duration)
    
    // Optional properties
    if let pictureMediumUrlString = json[APIKeys.pictureMedium] as? String {
      self.pictureMediumUrl = URL(string: pictureMediumUrlString)
    }
    if let pictureBigUrlString = json[APIKeys.pictureBig] as? String {
      self.pictureBigUrl = URL(string: pictureBigUrlString)
    }
  }
}
