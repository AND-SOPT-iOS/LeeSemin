//
//  UIView+.swift
//  AND-SOPT-iOS
//
//  Created by 이세민 on 10/29/24.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        views.forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
}
