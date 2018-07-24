//
//  StringHelper.swift
//  DeezerSample
//
//  Created by cpo on 24/07/2018.
//  Copyright © 2018 CPO. All rights reserved.
//

import Foundation

extension String {
  public var localized: String {
    return NSLocalizedString(self, comment: "")
  }
}
