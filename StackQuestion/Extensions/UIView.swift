//
//  UIView.swift
//  StackQuestion
//
//  Created by Robert Lechowicz on 08.08.2018.
//  Copyright © 2018 128pixels. All rights reserved.
//

import UIKit

extension UIView {
    func insertAttributtedText(_ text: String, to label: UILabel) {
        let background = DispatchQueue(label: "background")
        background.async {
            let attributedString = text.htmlToAttributedString
            DispatchQueue.main.async {
                label.attributedText = attributedString
            }
        }
    }
}
