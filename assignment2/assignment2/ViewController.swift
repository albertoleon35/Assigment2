//
//  ViewController.swift
//  assignment2
//
//  Created by Alberto Leon on 9/13/18.
//  Copyright © 2018 Alberto Leon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var redTextBox: UITextField!
    @IBOutlet weak var greenTextBox: UITextField!
    @IBOutlet weak var blueTextBox: UITextField!
    @IBOutlet weak var colorRectangle: UIView!
    
    @IBAction func coloButton(_ sender: Any) {
        if  let redTextBoxValue = redTextBox.text, let greenTextBoxValue = greenTextBox.text, let blueTextBoxValue = blueTextBox.text {
                if let redNumber = Int(redTextBoxValue), let greenNumber = Int(greenTextBoxValue), let blueNumber = Int(blueTextBoxValue) {
                    let colors = Colors(redColor: redNumber, greenColor: greenNumber, blueColor: blueNumber)
                    if (colors.isColorRangeValid()) {
                        colorRectangle.backgroundColor = colors.getColor();
                        colorRectangle.setNeedsDisplay();
                }
            }
        }
        else {
            colorRectangle.backgroundColor = .white;
            colorRectangle.setNeedsDisplay();
        }
        self.view.endEditing(true);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
