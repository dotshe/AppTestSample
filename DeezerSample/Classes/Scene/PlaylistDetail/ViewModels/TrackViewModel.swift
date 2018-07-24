//
//  TrackViewModel.swift
//  DeezerSample
//
//  Created by cpo on 24/07/2018.
//  Copyright © 2018 CPO. All rights reserved.
//

import Foundation
import RxSwift

class TrackViewModel {
  
  /*******************************************************************************/
  // MARK: - Properties
  
  // Observable
  private(set) var title: Variable<String?>
  private(set) var artist: Variable<ArtistModel?>
  private(set) var duration: Variable<TimeInterval?>
  
  // - Data
  private let track: TrackModel
  
  /*******************************************************************************/
  // MARK: - Birth and Death
  
  init(withTrack track: TrackModel) {
    self.track = track
    self.title = Variable(track.title)
    self.artist = Variable(track.artist)
    self.duration = Variable(track.duration)
  }
  
  /*******************************************************************************/
  // MARK: - Display
  
  /**
   * Returns a text formatted for a track's title
   *
   * return: The text formatted for a track's title
   */
  func titleFormatted() -> String {
    return track.title
  }
  
  /**
   * Returns a text formatted for a track's artist
   *
   * return: The text formatted for a track's artist
   */
  func artistFormatted() -> String {
    return track.artist.name
  }
  
  /**
   * Returns a text formatted for a track's duration
   *
   * return: The text formatted for a track's duration
   */
  func durationFormatted() -> String {
    return FormattersHelper.formatTrackDuration(track.duration)
  }
}
