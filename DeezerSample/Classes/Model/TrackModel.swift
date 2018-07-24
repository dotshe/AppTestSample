//
//  TrackModel.swift
//  DeezerSample
//
//  Created by cpo on 24/07/2018.
//  Copyright © 2018 CPO. All rights reserved.
//

import Foundation

protocol TrackModel: CustomStringConvertible {
  
  /*******************************************************************************/
  // MARK: - Properties
  
  /// Track's identifier
  var identifier: Int { get }
  
  /// Track's title
  var title: String { get }
  
  /// Track's duration in second
  var duration: TimeInterval { get }
  
  /// Track's preview
  var previewUrl: URL? { get }
  
  /// Track's artist
  var artist: ArtistModel { get }
}

/*******************************************************************************/
// MARK: - CustomStringConvertible

extension TrackModel {
  
  /// Description to display a playlist in console
  var description: String {
    return """
    identifier: \(self.identifier)
    title: \(self.title)
    duration: \(self.duration)
    previewUrl: \(String(describing: self.previewUrl))
    artist: \(self.artist)
    """
  }
}
