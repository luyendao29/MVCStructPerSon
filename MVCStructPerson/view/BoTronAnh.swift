//
//  BoTronAnh.swift
//  MVCStructPerson
//
//  Created by Boss on 4/24/19.
//  Copyright © 2019 Boss. All rights reserved.
//

import UIKit

@IBDesignable
class BoTronAnh: UIImageView {
    private var _cornerRadius: CGFloat = 0.0
    // hien thi ra ngoai` storyboard
    @IBInspectable
    var cornerRadius: CGFloat {
        set (newValue) {
            _cornerRadius = newValue
            layer.cornerRadius = frame.size.height / 2
        } get {
            return _cornerRadius
        }
    }
}
