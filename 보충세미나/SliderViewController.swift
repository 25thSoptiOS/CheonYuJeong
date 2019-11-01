//
//  SliderViewController.swift
//  보충세미나
//
//  Created by 천유정 on 03/10/2019.
//  Copyright © 2019 yujeong. All rights reserved.
//

import UIKit

class SliderViewController: UIViewController {

    @IBOutlet weak var sliderRed: UISlider!
    @IBOutlet weak var sliderGreen: UISlider!
    @IBOutlet weak var sliderBlue: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
@IBAction func updateColor(_ sender: UISlider) {
self.view.backgroundColor = UIColor.init(red: CGFloat(self.sliderRed.value),
green: CGFloat(self.sliderGreen.value),
blue: CGFloat(self.sliderBlue.value),
alpha: 1.0)
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
