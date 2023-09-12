//
//  UIColorExtension.swift
//  MallApp
//
//  Created by zouminyi on 9/12/23.
//

import UIKit

extension UIColor {
    
    // Convert Hex to UIColor
    static func fromHex(_ hexValue: Int, alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(
            red: CGFloat((hexValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hexValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hexValue & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
    
    convenience init(hexValue: Int, alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat((hexValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hexValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hexValue & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
    
    // Convert UIColor to UIImage
    func toImage() -> UIImage? {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        // Used the defer statement to ensure UIGraphicsEndImageContext() is called when exiting the scope, even if an early return or error occurs.
        defer { UIGraphicsEndImageContext() }
        
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(self.cgColor)
        context?.fill(rect)
        
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}
