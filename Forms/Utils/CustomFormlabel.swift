//
//  CustomFormlabel.swift
//  Forms
//
//  Created by sankara-pt6210 on 05/05/23.
//

import UIKit

class CustomFormlabel: UILabel {

    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 5)
        super.drawText(in: rect.inset(by: insets))
    }
}
