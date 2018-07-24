//
//  DeezerPaginationModel.swift
//  DeezerSample
//
//  Created by cpo on 24/07/2018.
//  Copyright © 2018 CPO. All rights reserved.
//

import Foundation

class DeezerPaginationModel: PaginationModel {
  
  /*******************************************************************************/
  // MARK: - Constants & Enums
  
  /// Keys from Deezer's API for a pagination
  struct APIKeys {
    static let total  = "total"
    static let next   = "next"
    static let prev   = "prev"
  }
  
  /*******************************************************************************/
  // MARK: - Properties
  
  let total: Int
  var nextUrl: URL? = nil
  var prevUrl: URL? = nil
  
  /*******************************************************************************/
  // MARK: - Birth and Death
  
  init?(json: [String: Any]) {
    // Required properties
    guard let total = json[APIKeys.total] as? Int else { return nil }
    
    self.total = total
    
    // Optional properties
    if let nextUrlString = json[APIKeys.next] as? String {
      self.nextUrl = URL(string: nextUrlString)
    }
    if let prevUrlString = json[APIKeys.prev] as? String {
      self.prevUrl = URL(string: prevUrlString)
    }
  }
}
