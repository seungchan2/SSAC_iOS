//
//  SignUp + PlaceholderTextColor.swift
//  SSAC_Nextflix
//
//  Created by 김승찬 on 2021/09/30.
//

import UIKit

public extension UITextField {
    
    func setPlaceholderColor(_ placeholderColor: UIColor) {
        attributedPlaceholder = NSAttributedString(
            string: placeholder ?? "",
            attributes: [
                .foregroundColor: placeholderColor,
                .font: font
            ].compactMapValues { $0 }
        )
    }
}


