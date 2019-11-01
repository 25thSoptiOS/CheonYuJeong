//
//  ViewController.swift
//  seminar21
//
//  Created by 천유정 on 12/10/2019.
//  Copyright © 2019 yujeong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var someImage: UIImageView!
    
    @IBOutlet weak var logoimg: UIImageView!
    @IBOutlet weak var idView: UIView!
    @IBOutlet weak var pwView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addObserver()
    }


}

extension ViewController: UITextFieldDelegate {
    private func addObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(upKeyboard), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(downKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func upKeyboard() {
        self.view.frame.origin.y = CGFloat(-160)
    }
    
    @objc func downKeyboard() {
        self.view.frame.origin.y = 0
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
