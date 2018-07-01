//
//  PlaylistModel.swift
//  DeezerSample
//
//  Created by cpo on 01/07/2018.
//  Copyright © 2018 CPO. All rights reserved.
//

import Foundation

protocol PlaylistModel: CustomStringConvertible {
  
  /*******************************************************************************/
  // MARK: - Properties
  
  /// Playlist's identifier
  var identifier: Int { get }
  
  /// Playlist's title
  var title: String { get }
  
  /// Platlist's duration in second
  var duration: TimeInterval { get }
  
  /// Playlist's cover in medium size (ie: for playlists listing)
  var pictureMediumUrl: URL? { get }
  
  /// Playlist's cover in big size (ie: for playlist detail)
  var pictureBigUrl: URL? { get }
}

/*******************************************************************************/
// MARK: - CustomStringConvertible

extension PlaylistModel {
  
  /// Description to display a playlist in console
  var description: String {
    return """
    identifier: \(self.identifier)
    title: \(self.title)
    duration: \(self.duration)
    pictureMediumUrl: \(String(describing: self.pictureMediumUrl))")
    pictureBigUrl: \(String(describing: self.pictureBigUrl))")
    """
  }
}
