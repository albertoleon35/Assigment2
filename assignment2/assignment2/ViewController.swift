//
//  ViewController.swift
//  assignment2
//
//  Created by Alberto Leon on 9/13/18.
//  Copyright © 2018 Alberto Leon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let redNumberKey : String = "redNumber";
    let greenNumberKey : String = "greenNumber";
    let blueNumberKey : String = "blueNumber";
    var userDefaults : UserDefaults?;
    
    @IBOutlet weak var redLabel: UILabel!;
    @IBOutlet weak var greenLabel: UILabel!;
    @IBOutlet weak var blueLabel: UILabel!;
    @IBOutlet weak var redTextBox: UITextField!;
    @IBOutlet weak var greenTextBox: UITextField!;
    @IBOutlet weak var blueTextBox: UITextField!;
    @IBOutlet weak var colorRectangle: UIView!
    
    @IBAction func coloButton(_ sender: Any) {
        
        guard let redTextBoxValue = redTextBox.text, let greenTextBoxValue = greenTextBox.text, let blueTextBoxValue = blueTextBox.text else {
            return;
        }
        guard let redNumber = Int(redTextBoxValue), let greenNumber = Int(greenTextBoxValue), let blueNumber = Int(blueTextBoxValue) else {
            return;
        }
        
        let colors = Colors(redColor: redNumber, greenColor: greenNumber, blueColor: blueNumber)
    
        guard colors.isColorRangeValid() else {
            colorRectangle.backgroundColor = .white;
            return;
        }
        
        self.persistColors(colors: colors);
        colorRectangle.backgroundColor = colors.getColor();
        self.view.endEditing(true);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userDefaults = UserDefaults();
        self.setTextBoxesText();
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    fileprivate func persistColors(colors: Colors) {
        self.userDefaults?.set(colors.getRedColor(), forKey: redNumberKey);
        self.userDefaults?.set(colors.getGreenColor(), forKey: greenNumberKey);
        self.userDefaults?.set(colors.getBlueColor(), forKey: blueNumberKey);
    }
    
    fileprivate func setTextBoxesText() {
        if let redNumber = self.userDefaults?.integer(forKey: redNumberKey) {
            redTextBox.text = "\(redNumber)";
        }
        if let greenNumber = self.userDefaults?.integer(forKey: greenNumberKey) {
            greenTextBox.text = "\(greenNumber)";
        }
        if let blueNumber = self.userDefaults?.integer(forKey: blueNumberKey) {
            blueTextBox.text = "\(blueNumber)"
        }
    }
}
