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
  
  /**
   * Gets the tracks according a playlist identifier at a specified page.
   *
   * - parameter playlistIdentifier : The playlist identifier.
   * - parameter completionHandler  : The closure called when tracks are loaded
   */
  func getTracks(playlistIdentifier: Int, at page: Int = 0, completionHandler: @escaping GetTracksHandlerType) {
    // Get tracks in 'cache' if possible
    // NO CACHE implemented for tracks.
    
    // Call Deezer's API
    TrackRepository.deezerAPI.getTracks(playlistIdentifier: playlistIdentifier, at: page) { (tracks, pagination, error) in
      completionHandler(tracks, pagination, error)
    }
  }
}
