//
//  UILabel+Extension.swift
//  Travel
//
//  Created by 금가경 on 7/16/25.
//

import UIKit

extension UILabel {
    func highlightIgnoringCase(of targetText: String, with color: UIColor) {
        let fullText = text ?? ""
        let attributedString = NSMutableAttributedString(string: fullText)
        let range = (fullText.lowercased() as NSString).range(of: targetText.lowercased())
        attributedString.addAttribute(.foregroundColor, value: color, range: range)
        attributedText = attributedString
    }
}
