//
//  Extensions+Double.swift
//  Sarrafi
//
//  Created by armin on 7/14/21.
//

import Foundation

extension Double {
    var clean: String {
       return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
