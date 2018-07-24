//
//  FormattersHelper.swift
//  DeezerSample
//
//  Created by cpo on 24/07/2018.
//  Copyright © 2018 CPO. All rights reserved.
//

import Foundation

class FormattersHelper {
  
  /*******************************************************************************/
  // MARK: - Statics
  
  static private let dateComponentsFormatter = DateComponentsFormatter()
  
  /*******************************************************************************/
  // MARK: - TimeInterval
  
  static func formatPlaylistDuration(_ duration: TimeInterval) -> String {
    return formatGenericDuration(duration)
  }
  
  static func formatTrackDuration(_ duration: TimeInterval) -> String {
    return formatGenericDuration(duration)
  }
  
  static func formatGenericDuration(_ duration: TimeInterval) -> String {
    let formatter: DateComponentsFormatter = dateComponentsFormatter
    
    // AllowedUnits:
    // Only 'hour' | 'minute' | 'second'
    formatter.allowedUnits = [.second, .minute, .hour]
    
    // UnitsStyle:
    // ie: h:m:s
    formatter.unitsStyle = .abbreviated
    
    // MaximumUnitCount:
    // ie: 2h:30m | 5m:30s | 59s
    formatter.maximumUnitCount = 2
    
    if let durationFormatted = formatter.string(from: duration) {
      return durationFormatted
    }
    
    return "mm:ss"
  }
}
