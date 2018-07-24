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
  
  func titleFormatted() -> String {
    return track.title
  }
  
  func artistFormatted() -> String {
    return track.artist.name
  }
  
  func durationFormatted() -> String {
    return FormattersHelper.formatTrackDuration(track.duration)
  }
}
