//
//  Extensions.swift
//  Dogs List
//
//  Created by Tracey Dolby on 10/27/23.
//

import Foundation

extension String {
  func capitalizeFirstLetter() -> String {
    return self.prefix(1).uppercased() + self.lowercased().dropFirst()
  }
}
