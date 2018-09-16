//
//  StringToIntValidator.swift
//  assignment2
//
//  Created by Alberto Leon on 9/15/18.
//  Copyright © 2018 Alberto Leon. All rights reserved.
//

import Foundation

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
    
    func isColorRangeValid() -> Bool {
        return  self.redColorNumber <= colorRequirement &&
                self.greenColorNumber <= colorRequirement &&
                self.blueColorNumber <= colorRequirement;
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
}
