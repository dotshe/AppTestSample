//
//  DeezerAPI+Track.swift
//  DeezerSample
//
//  Created by cpo on 24/07/2018.
//  Copyright © 2018 CPO. All rights reserved.
//

import Foundation

extension DeezerAPI {
  
  /*******************************************************************************/
  // MARK: - Types
  
  typealias GetTracksHandlerType = ((_ tracks: [DeezerTrackModel], _ pagination: DeezerPaginationModel?, _ error: Error?) -> ())
  
  /*******************************************************************************/
  // MARK: - Actions
  
  /**
   * Gets tracks for a playlist with the specified identifier.
   *
   * - parameter identifier         : The playlist's identifier
   * - parameter page               : The page for tracks
   * - parameter completionHandler  : The closure called when the request is completed
   */
  func getTracks(playlistIdentifier: Int, at page: Int, completionHandler: @escaping GetTracksHandlerType) {
    let path: String = Paths.playlistTracks(playlistIdentifier: playlistIdentifier).value
    let parameters: [String: Any] = [
      "index":page*25,
      "limit":25
    ]
    let request: NetworkerRequest = constructRequest(method: .get, path: path, parameters: parameters)
    Networker.execute(request: request) { response, error in
      // Manage 'error'
      guard error == nil else {
        completionHandler([], nil, error)
        return
      }
      // Manage 'response'
      guard let json = response as? [String: Any] else {
        completionHandler([], nil, error)
        return
      }
      
      // Parsing
      let tracks: [DeezerTrackModel] = self.parseDeezerTracks(fromJson: json)
      let pagination: DeezerPaginationModel? = self.parseDeezerPagination(fromJson: json)
      completionHandler(tracks, pagination, nil)
    }
  }
  
  /**
   * Parses a deezer tracks from JSON.
   *
   * - parameter json: An object that represents tracks in JSON.
   *
   * - return: An array of 'DeezerTrackModel'
   */
  private func parseDeezerTracks(fromJson json: [String: Any]) -> [DeezerTrackModel] {
    var tracks: [DeezerTrackModel] = []
    
    if let jsonTracks = json["data"] as? [[String: Any]] {
      for jsonTrack in jsonTracks {
        if let track = DeezerTrackModel(json: jsonTrack) {
          tracks.append(track)
        }
      }
    }
    
    return tracks
  }
  
  /**
   * Parses a deezer pagination from JSON.
   *
   * - parameter json: An object that represents tracks with pagination in JSON.
   *
   * - return: A 'DeezerPaginationModel' object
   */
  private func parseDeezerPagination(fromJson json: [String: Any]) -> DeezerPaginationModel? {
    return DeezerPaginationModel(json: json)
  }
}
