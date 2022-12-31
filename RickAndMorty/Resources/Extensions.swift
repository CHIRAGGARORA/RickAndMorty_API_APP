//
//  Extensions.swift
//  RickAndMorty
//
//  Created by chirag arora on 30/12/22.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({
            
            addSubview($0)
        })
    }
    
}
