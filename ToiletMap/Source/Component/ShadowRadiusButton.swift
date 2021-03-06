//
//  ShadowRadiusButton.swift
//  ToiletMap
//
//  Created by Fumiya Tanaka on 2020/01/09.
//

import Foundation
import UIKit

class ShadowRadiusButton: UIButton {

  @IBInspectable var cornerRadius: CGFloat {
    get {
      layer.cornerRadius == 0 ? min(frame.width, frame.height) / 2 : layer.cornerRadius
    }
    set {
      layer.cornerRadius = newValue
    }
  }

  @IBInspectable var shadowRadius: CGFloat {
    get {
      layer.shadowRadius == 0 ? min(frame.width, frame.height) / 2 : layer.shadowRadius
    }
    set {
      layer.shadowRadius = newValue
    }
  }

  @IBInspectable var borderWidth: CGFloat {
    get {
      self.layer.borderWidth
    }
    set {
      self.layer.borderWidth = newValue
    }
  }

  private var shadowLayer: ShadowLayer? = ShadowLayer()

  init(frame: CGRect, borderWidth: CGFloat, buttonTitle: String?, buttonImage: UIImage?) {
    super.init(frame: frame)
    layer.masksToBounds = true
    setTitle(buttonTitle, for: .normal)
    setImage(buttonImage, for: .normal)
    layer.borderWidth = borderWidth
    layer.borderColor = tintColor.cgColor
    layer.addSublayer(shadowLayer!)
    adjustsImageSizeForAccessibilityContentSizeCategory = true
    titleLabel?.adjustsFontForContentSizeCategory = true
    imageView?.adjustsImageSizeForAccessibilityContentSizeCategory = true
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    layer.masksToBounds = true
    layer.borderWidth = borderWidth
    layer.borderColor = tintColor.cgColor
    shadowLayer?.shadowRadius = shadowRadius
    layer.addSublayer(shadowLayer!)
    adjustsImageSizeForAccessibilityContentSizeCategory = true
    titleLabel?.adjustsFontForContentSizeCategory = true
    imageView?.adjustsImageSizeForAccessibilityContentSizeCategory = true
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    shadowLayer?.addShadow(shadowRadius: shadowRadius)
  }

}

class ShadowLayer: CALayer, Shadow {

  override init(layer: Any) {
    super.init(layer: layer)
  }

  override init() {
    super.init()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }

}
