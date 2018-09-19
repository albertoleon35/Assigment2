//
//  StringToIntValidator.swift
//  assignment2
//
//  Created by Alberto Leon on 9/15/18.
//  Copyright © 2018 Alberto Leon. All rights reserved.
//

import Foundation
import UIKit

public struct Colors  {
    private let colorRequirement : Int = 100;
    private let redColorNumber : Int;
    private let greenColorNumber : Int;
    private let blueColorNumber : Int;
    
    init(redColor: Int, greenColor: Int, blueColor: Int) {
        self.redColorNumber = redColor;
        self.greenColorNumber = greenColor;
        self.blueColorNumber = blueColor;
    }
    
    init(redColor: Int) {
        self.redColorNumber = redColor;
        self.greenColorNumber = 0;
        self.blueColorNumber = 0;
    }
    
    func isColorRangeValid() -> Bool {
        return  (self.redColorNumber <= colorRequirement && self.redColorNumber > 0) &&
                (self.greenColorNumber <= colorRequirement && self.greenColorNumber > 0) &&
                (self.blueColorNumber <= colorRequirement && self.blueColorNumber > 0);
    }
    
    public func getRedColor() -> Int {
        return self.redColorNumber;
    }
    
    public func getGreenColor() -> Int {
        return self.greenColorNumber;
    }
    
    public func getBlueColor() -> Int {
        return self.blueColorNumber;
    }

    public func getBackgroundColor() -> UIColor {
        let red:CGFloat = CGFloat(getRgbColor(color: self.redColorNumber) / 255);
        let green:CGFloat = CGFloat(getRgbColor(color: self.greenColorNumber) / 255);
        let blue:CGFloat = CGFloat(getRgbColor(color: self.blueColorNumber) / 255);
        
        return UIColor(red:red, green: green, blue: blue, alpha: 1.0);
    }
    
    private func getRgbColor(color: Int) -> Double {
        return Double(color) * 2.55;
    }
}
