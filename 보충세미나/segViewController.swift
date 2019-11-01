//
//  SegViewController.swift
//  보충세미나
//
//  Created by 천유정 on 03/10/2019.
//  Copyright © 2019 yujeong. All rights reserved.
//

import UIKit

class SegViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func prepare (for segue: UIStoryboardSegue, sender: Any?){
    let destVC = segue.destination as! SegControlViewController
    
    let situation: String! = leftRightSegControl.titleForSegment(at: leftRightSegControl.selectedSegmentIndex)
    
    destVC.title = situation
    
    makeString = situation
    makeString += " 선택됨"
    
    // ViewController에서 정보를 받아 문자열 출력
    destVC.info = makeString
    
    // ViewController에서 Index를 받아 세그먼트 출력
    destVC.selectedSegmentIndex = leftRightSegControl.selectedSegmentIndex
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
