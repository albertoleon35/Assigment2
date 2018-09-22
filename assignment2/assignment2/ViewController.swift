//
//  ViewController.swift
//  assignment2
//
//  Created by Alberto Leon on 9/13/18.
//  Copyright © 2018 Alberto Leon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let redNumberKey: String = "redNumber";
    let greenNumberKey: String = "greenNumber";
    let blueNumberKey : String = "blueNumber";
    let redBackgroundColorKey: String = "redBackgroundColor";
    let greenBackgroundColorKey: String = "greenBackgroundColor";
    let blueBackgroundColorKey: String = "blueBackgroundColor";
    var userDefaults: UserDefaults?;
    
    @IBOutlet weak var redLabel: UILabel!;
    @IBOutlet weak var greenLabel: UILabel!;
    @IBOutlet weak var blueLabel: UILabel!;
    @IBOutlet weak var redTextBox: UITextField!;
    @IBOutlet weak var greenTextBox: UITextField!;
    @IBOutlet weak var blueTextBox: UITextField!;
    @IBOutlet weak var colorRectangle: UIView!
    
    @IBAction func colorButton(_ sender: Any) {
        
        guard let redTextBoxValue = redTextBox.text, let greenTextBoxValue = greenTextBox.text, let blueTextBoxValue = blueTextBox.text  else {
            self.view.endEditing(true);
            colorRectangle.backgroundColor = .white;
            return;
        }
        guard let redNumber = Int(redTextBoxValue), let greenNumber = Int(greenTextBoxValue), let blueNumber = Int(blueTextBoxValue) else {
            self.view.endEditing(true);
            colorRectangle.backgroundColor = .white;
            return;
        }
        
        let redColor = Color(color: redNumber);
        let greenColor = Color(color: greenNumber);
        let blueColor = Color(color: blueNumber);
        
        guard redColor.isColorRangeValid() && greenColor.isColorRangeValid() && blueColor.isColorRangeValid() else {
            self.view.endEditing(true);
            return;
        }
        
        colorRectangle.backgroundColor = UIColor(red:redColor.getBackgroundColor(), green: greenColor.getBackgroundColor(), blue: blueColor.getBackgroundColor(), alpha: 1.0);
        self.view.endEditing(true);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.userDefaults = UserDefaults();
        self.setAppBackgroundListener();
        self.setUpNumericKeyboard();
        self.setRedTextBox();
        self.setGreenTextBox();
        self.setBlueTextBox();
        self.colorBackground();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func appMovedToBackground() {
        if let redColor = redTextBox.text {
            persistColor(color: redColor, key: redNumberKey);
        }
        if let greenColor = greenTextBox.text {
            persistColor(color: greenColor, key: greenNumberKey);
        }
        if let blueColor = blueTextBox.text {
            persistColor(color: blueColor, key: blueNumberKey);
        }
        
        if let backgroundColor = colorRectangle.backgroundColor {
            persistBackgroundColor(color: backgroundColor);
        }
    }
    
    fileprivate func setUpNumericKeyboard() {
        redTextBox.keyboardType = .numberPad;
        greenTextBox.keyboardType = .numberPad;
        blueTextBox.keyboardType = .numberPad;
    }
    
    fileprivate func setAppBackgroundListener() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(appMovedToBackground), name: Notification.Name.UIApplicationWillResignActive, object: nil)
    }
    
    fileprivate func persistColor(color: String, key: String) {
        guard let colorNumber = Int(color) else {
            self.userDefaults?.set(-1, forKey: key);
            return;
        }
        self.userDefaults?.set(colorNumber, forKey: key);
    }
    
    fileprivate func persistBackgroundColor(color: UIColor) {
        var red:   CGFloat = 0
        var green: CGFloat = 0
        var blue:  CGFloat = 0
        var alpha: CGFloat = 0
        
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        userDefaults?.set(Double(red), forKey: redBackgroundColorKey);
        userDefaults?.set(Double(green), forKey: greenBackgroundColorKey);
        userDefaults?.set(Double(blue), forKey: blueBackgroundColorKey);
    }
    
    fileprivate func setRedTextBox() {
        guard let redNumber = self.userDefaults?.integer(forKey: redNumberKey), redNumber >= 0  else {
            return;
        }
        redTextBox.text = "\(redNumber)";
    }
    
    fileprivate func setGreenTextBox() {
        guard let greenNumber = self.userDefaults?.integer(forKey: greenNumberKey), greenNumber >= 0 else {
            return;
        }
        greenTextBox.text = "\(greenNumber)";
    }
    
    fileprivate func setBlueTextBox() {
        guard let blueNumber = self.userDefaults?.integer(forKey: blueNumberKey), blueNumber >= 0 else {
            return;
        }
        blueTextBox.text = "\(blueNumber)";
    }
    
    fileprivate func colorBackground() {
        
        guard let redNumber = self.userDefaults?.double(forKey: redBackgroundColorKey) else {
            return;
        }
        guard let greenNumber = self.userDefaults?.double(forKey: greenBackgroundColorKey) else {
            return;
        }
        guard let blueNumber = self.userDefaults?.double(forKey: blueBackgroundColorKey) else {
            return;
        }
        
        colorRectangle.backgroundColor = UIColor(red: CGFloat(redNumber), green: CGFloat(greenNumber), blue: CGFloat(blueNumber), alpha: CGFloat(1.0))
    }
}
