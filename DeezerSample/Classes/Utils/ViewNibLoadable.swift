//
//  ViewNibLoadable.swift
//  DeezerSample
//
//  Created by cpo on 01/07/2018.
//  Copyright © 2018 CPO. All rights reserved.
//

import Foundation

protocol ViewNibLoadable: class {
  static var nibIdentifier: String { get }
  static var bundle: Bundle? { get }
}

extension ViewNibLoadable {
  static var nibIdentifier: String {
    return String(describing: self)
  }
  static var bundle: Bundle? {
    return Bundle(for: self)
  }
}
