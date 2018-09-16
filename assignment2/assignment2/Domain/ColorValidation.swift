//
//  ColorValidation.swift
//  assignment2
//
//  Created by Alberto Leon on 9/15/18.
//  Copyright © 2018 Alberto Leon. All rights reserved.
//

import Foundation
public class ColorValidation {
    let colorRequirement : Int = 100;
    let colors : ColorDTO;
    
    init(colors: ColorDTO) {
        self.colors = color;
    }
    
    func isColorRangeValid() -> Bool {
        return  self.color.getBlueColorNumber() <= colorRequirement &&
                self.color.getRedColor() <= colorRequirement &&
                self.color.getGreenColor() <= colorRequirement;
    }
}
