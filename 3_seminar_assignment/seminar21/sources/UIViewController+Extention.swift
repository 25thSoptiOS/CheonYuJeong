//
//  UIViewController+Extention.swift
//  seminar21
//
//  Created by 천유정 on 02/11/2019.
//  Copyright © 2019 yujeong. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    //type: 0 심플
    //type: 1 alert종료
    func simpleAlert(title: String, message: String, type: Int?){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        var ok: UIAlertAction
        if type == 0{
            ok = UIAlertAction(title: "확인", style: .cancel)
        }else{
            ok = UIAlertAction(title: title, style: .cancel, handler: {action in
                self.dismiss(animated: true)
            })
            
        }
        alert.addAction(ok)
        
        self.present(alert, animated: true)
    }
}
