//
//  DeezerArtistModel.swift
//  DeezerSample
//
//  Created by cpo on 24/07/2018.
//  Copyright © 2018 CPO. All rights reserved.
//

import Foundation

class DeezerArtistModel: ArtistModel {
  
  /*******************************************************************************/
  // MARK: - Constants & Enums
  
  /// Keys from Deezer's API for an artist
  struct APIKeys {
    static let identifier     = "id"
    static let name           = "name"
  }
  
  /*******************************************************************************/
  // MARK: - Properties
  
  let identifier: Int
  let name: String
  
  /*******************************************************************************/
  // MARK: - Birth and Death
  
  init?(json: [String: Any]) {
    // Required properties
    guard let identifier = json[APIKeys.identifier] as? Int else { return nil }
    guard let name = json[APIKeys.name] as? String else { return nil }
    
    self.identifier = identifier
    self.name = name
  }
}
