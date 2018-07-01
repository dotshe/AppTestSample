//
//  ViewReusable.swift
//  DeezerSample
//
//  Created by cpo on 01/07/2018.
//  Copyright © 2018 CPO. All rights reserved.
//

import UIKit

protocol ViewReusable: ViewNibLoadable {
  static var reuseIdentifier: String { get }
  static var nib: UINib? { get }
}

extension ViewReusable {
  public static var reuseIdentifier: String {
    return String(describing: self)
  }
  public static var nib: UINib? {
    return UINib(nibName: reuseIdentifier, bundle: Bundle(for: self))
  }
}
