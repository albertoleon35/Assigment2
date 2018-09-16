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
        if  let redTextBoxValue = Int(redTextBox.text!),
            let greenTextBoxValue = Int(greenTextBox.text!),
            let blueTextBoxValue = Int(blueTextBox.text!) {
            
            let colors = Colors(redColor: redTextBoxValue, greenColor: greenTextBoxValue, blueColor: blueTextBoxValue)
            if (colors.isColorRangeValid()) {
                colorRectangle.backgroundColor = getColor(red: colors.getRedColor(), green: colors.getGreenColor(), blue: colors.getBlueColor())
            }
            else {
                colorRectangle.backgroundColor = .white;
            }
        }
    }
    
    func getColor(red: Int, green: Int, blue: Int) -> UIColor {
        //Generate between 0 to 1
        let red:CGFloat = CGFloat(red)
        let green:CGFloat = CGFloat(green)
        let blue:CGFloat = CGFloat(blue)
        
        return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
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
