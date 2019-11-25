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
    
    
    @IBOutlet weak var loginUserid: UITextField!
    @IBOutlet weak var loginPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addObserver()
    }
    
    @IBAction func loginButton(_ sender: Any) {
        // 로그인 서버 통신 구현 코드
                   guard let id = loginUserid.text else { return }
                   guard let pwd = loginPassword.text else { return }
                   
        LoginService.shared.login(id, pwd) {
            data in
            
            switch data {
                
            case .success(let data):
                
                // DataClass 에서 받은 유저 정보 반환
                let user_data = data as! DataClass
                
                // 사용자의 토큰, 이름, 이메일, 전화번호 받아오기
                // 비밀번호는 안 받아와도 됨
                UserDefaults.standard.set(user_data.userIdx, forKey: "token")
                UserDefaults.standard.set(user_data.name, forKey: "name")
                UserDefaults.standard.set(user_data.phone, forKey: "phone")
                
                guard let main = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") else {return}
                self.present(main, animated: true)
                
            case .requestErr(let message):
                self.simpleAlert(title: "로그인 실패", message: "\(message)", type: 0)
                
            case .pathErr:
                print(".pathErr")
                
            case .serverErr:
                print(".serverErr")
                
            case .networkFail:
                self.simpleAlert(title: "로그인 실패", message: "네트워크 상태를 확인해주세요.", type: 0)
            }
            
        }
    }
    @IBAction func signup(_ sender: Any) {
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
