//
//  LeftImage.swift
//  WeatherApp
//
//  Created by Hakan Or on 11.07.2022.
//

import UIKit

extension UITextField {
    func leftImage(_ image: UIImage?, imageWidth: CGFloat, padding: CGFloat) {
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: padding, y: 0, width: imageWidth, height: frame.height)
        imageView.contentMode = .center
        imageView.tintColor = .black
        imageView.alpha = 0.3
        
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: imageWidth + 2 * padding, height: frame.height))
        containerView.addSubview(imageView)
        leftView = containerView
        leftViewMode = .always
    }
}
