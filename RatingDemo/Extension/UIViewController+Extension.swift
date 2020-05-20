//
//  UIViewController+Extension.swift
//  RatingDemo
//
//  Created by Mayanshi Gupta on 20/05/20.
//  Copyright © 2020 Stamurai. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlert(withTitle alertTitle: String, alertMessage : String) {
        let alert =  UIAlertController(title: alertTitle, message:alertMessage, preferredStyle: .alert)
        let okAction = UIAlertAction(title:"Ok", style: .default, handler:nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}
