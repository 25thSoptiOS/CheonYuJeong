//
//  ViewController.swift
//  보충세미나
//
//  Created by 천유정 on 03/10/2019.
//  Copyright © 2019 yujeong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let candleoffimage = UIImage(named:"candle-off.jpg")
    let candleonimage = UIImage (named:"candle-on.jpg")
    
    @IBOutlet weak var on_text: UILabel!
    @IBOutlet weak var candleon: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    }


    @IBAction func onslide(_ sender: UISwitch) {
        if (sender.isOn)
        {
            on_text.text = "Candle is On"
            candleon.image = candleonimage
        }
        else
        {
            on_text.text = "Candle is Off"
            candleon.image = candleoffimage
        }
    }
}

