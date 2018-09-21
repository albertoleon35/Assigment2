//
//  StringToIntValidator.swift
//  assignment2
//
//  Created by Alberto Leon on 9/15/18.
//  Copyright © 2018 Alberto Leon. All rights reserved.
//

import Foundation
import UIKit

public struct Color {
    private let colorRequirement : Int = 100;
    private let color : Int;
    
    init(color: Int) {
        self.color = color;
    }
    
    func isColorRangeValid() -> Bool {
        return (self.color <= colorRequirement && self.colorRequirement > 0);
    }
    
    public func getColor() -> Int {
        return self.color;
    }
    
    public func getBackgroundColor() -> CGFloat {
        let color = CGFloat(getRgbColor(color: self.color) / 255);
        return color;
    }
    
    private func getRgbColor(color: Int) -> Double {
        return Double(color) * 2.55;
    }
}
