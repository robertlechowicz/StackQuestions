//
//  Date.swift
//  StackQuestion
//
//  Created by Robert Lechowicz on 07.08.2018.
//  Copyright © 2018 128pixels. All rights reserved.
//

import UIKit

extension Date {
    var formatted: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: self)
    }
}
