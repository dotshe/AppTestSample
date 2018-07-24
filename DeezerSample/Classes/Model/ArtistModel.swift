//
//  ArtistModel.swift
//  DeezerSample
//
//  Created by cpo on 24/07/2018.
//  Copyright © 2018 CPO. All rights reserved.
//

import Foundation

protocol ArtistModel: CustomStringConvertible {
  
  /*******************************************************************************/
  // MARK: - Properties
  
  /// Artist's identifier
  var identifier: Int { get }
  
  /// Artist's name
  var name: String { get }
}

/*******************************************************************************/
// MARK: - CustomStringConvertible

extension ArtistModel {
  
  /// Description to display an 'ArtistModel' in console
  var description: String {
    return """
    identifier: \(self.identifier)
    name: \(self.name)
    """
  }
}
