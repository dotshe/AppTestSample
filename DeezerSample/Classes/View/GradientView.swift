//
//  GradientView.swift
//  DeezerSample
//
//  Created by cpo on 01/07/2018.
//  Copyright © 2018 CPO. All rights reserved.
//

import UIKit

class GradientView: UIView {
  
  /*******************************************************************************/
  // MARK: - Properties
  
  var gradientLayer: CAGradientLayer {
    return layer as! CAGradientLayer
  }
  
  @IBInspectable public var isVertical: Bool = true
  
  @IBInspectable var startColor: UIColor = UIColor.clear {
    didSet {
      updateColor()
    }
  }
  
  @IBInspectable var endColor: UIColor = UIColor.clear  {
    didSet {
      updateColor()
    }
  }
  
  open override class var layerClass : AnyClass {
    return CAGradientLayer.self
  }
  
  /*******************************************************************************/
  // MARK: - Birth and Death
  
  override func awakeFromNib() {
    super.awakeFromNib()
    updateColor()
  }
  
  /*******************************************************************************/
  // MARK: - Update
  
  fileprivate func updateColor() {
    gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
    if isVertical == false {
      gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
      gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
    }
  }
}
