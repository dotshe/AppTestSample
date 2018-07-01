//
//  ImageView+Loading.swift
//  DeezerSample
//
//  Created by cpo on 01/07/2018.
//  Copyright © 2018 CPO. All rights reserved.
//

import Foundation
import AlamofireImage

extension UIImageView {
  
  func setImage(url: URL?, placeholder: UIImage? = nil) {
    guard let url = url else {
      self.image = placeholder
      return
    }
    
    af_setImage(withURL: url,
                placeholderImage: placeholder,
                imageTransition: .crossDissolve(0.3),
                runImageTransitionIfCached: false) { response in
                  switch(response.result) {
                  case .success(let image):
                    self.highlightedImage = image.applyOnImage(alpha: 0.7)
                  default:
                    break
                  }
    }
  }
}
