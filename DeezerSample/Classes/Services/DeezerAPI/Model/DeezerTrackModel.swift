//
//  DeezerTrackModel.swift
//  DeezerSample
//
//  Created by cpo on 24/07/2018.
//  Copyright © 2018 CPO. All rights reserved.
//

import Foundation

class DeezerTrackModel: TrackModel {
  
  /*******************************************************************************/
  // MARK: - Constants & Enums
  
  /// Keys from Deezer's API for a track
  struct APIKeys {
    static let identifier     = "id"
    static let title          = "title"
    static let duration       = "duration"
    static let previewUrl     = "preview"
    static let artist         = "artist"
  }
  
  /*******************************************************************************/
  // MARK: - Properties
  
  let identifier: Int
  let title: String
  let duration: TimeInterval
  var previewUrl: URL? = nil
  let artist: ArtistModel
  
  /*******************************************************************************/
  // MARK: - Birth and Death
  
  init?(json: [String: Any]) {
    // Required properties
    guard let identifier = json[APIKeys.identifier] as? Int else { return nil }
    guard let title = json[APIKeys.title] as? String else { return nil }
    guard let duration = json[APIKeys.duration] as? Double else { return nil }
    guard let artistJson = json[APIKeys.artist] as? [String: Any] else { return nil }
    guard let artist = DeezerArtistModel(json: artistJson) else { return nil }
    
    self.identifier = identifier
    self.title = title
    self.duration = TimeInterval(duration)
    self.artist = artist
    
    // Optional properties
    if let previewUrlString = json[APIKeys.previewUrl] as? String {
      self.previewUrl = URL(string: previewUrlString)
    }
  }
}
