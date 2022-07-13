//
//  NSMutableAttributedString+Color.swift
//  WeatherApp
//
//  Created by Hakan Or on 12.07.2022.
//

import Foundation
import UIKit

extension NSMutableAttributedString {

    func setColorForText(textForAttribute: String, withColor color: UIColor) {
        let range: NSRange = self.mutableString.range(of: textForAttribute, options: .caseInsensitive)
        self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
    }

}
