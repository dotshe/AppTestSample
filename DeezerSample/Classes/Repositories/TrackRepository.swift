//
//  TrackRepository.swift
//  DeezerSample
//
//  Created by cpo on 24/07/2018.
//  Copyright © 2018 CPO. All rights reserved.
//

import Foundation

class TrackRepository {
  
  /*******************************************************************************/
  // MARK: - Types
  
  typealias GetTracksHandlerType = ((_ tracks: [TrackModel]?, _ pagination: PaginationModel?, _ error: Error?) -> ())
  
  /*******************************************************************************/
  // MARK: - Properties
  
  private static let deezerAPI: DeezerAPI = DeezerAPI()
  
  /*******************************************************************************/
  // MARK: - CRUD
  
  func getTracks(playlistIdentifier: Int, at page: Int = 0, completionHandler: @escaping GetTracksHandlerType) {
    TrackRepository.deezerAPI.getTracks(playlistIdentifier: playlistIdentifier, at: page) { (tracks, pagination, error) in
      completionHandler(tracks, pagination, error)
    }
  }
}
