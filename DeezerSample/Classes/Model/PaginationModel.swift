//
//  PaginationModel.swift
//  DeezerSample
//
//  Created by cpo on 24/07/2018.
//  Copyright © 2018 CPO. All rights reserved.
//

import Foundation

protocol PaginationModel: CustomStringConvertible {
  
  /*******************************************************************************/
  // MARK: - Properties
  
  /// Total number of elements
  var total: Int { get }
  
  /// URL for previous page
  var prevUrl: URL? { get }
  
  /// URL for next page
  var nextUrl: URL? { get }
}

/*******************************************************************************/
// MARK: - CustomStringConvertible

extension PaginationModel {
  
  /// Description to display a pagination in console
  var description: String {
    return """
    total: \(self.total)
    prevUrl: \(String(describing: self.prevUrl)))
    nextUrl: \(String(describing: self.nextUrl))
    """
  }
}

