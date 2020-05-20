//
//  RatingViewController.swift
//  RatingDemo
//
//  Created by Mayanshi Gupta on 19/05/20.
//  Copyright © 2020 Stamurai. All rights reserved.
//

import UIKit

class RatingViewController: UIViewController {

    @IBOutlet weak var ratingButton: UIButton!
    var minRating: Int?
    var maxRating: Int?
    
    @IBOutlet weak var maxRatingTxtField: UITextField!
    @IBOutlet weak var minRatingTxtField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //hide keyboard when tapped anywhere
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    fileprivate func resetData() {
        minRatingTxtField.text = ""
        maxRatingTxtField.text = ""
        minRating = nil
        maxRating = nil
        ratingButton.setTitle("Rating 0-9", for: .normal)
        self.view.endEditing(true)
    }
    
    fileprivate func showMaxRatingAlert() {
        guard let minValue = minRating else { return }
        guard let maxValue = maxRating else { return }
        if minValue > maxValue  {
            showAlert(withTitle:"", alertMessage: "Min Rating can't be greater than Max Rating")
            resetData()
            return
        }
        if minValue == maxValue {
            showAlert(withTitle:"", alertMessage: "Min Rating can't be equal to Max Rating")
            resetData()
            return
        }
    }
    
    //send min and max value to submit view Controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if minRatingTxtField.hasText && maxRatingTxtField.hasText {
            showMaxRatingAlert()
            if segue.identifier == "submitSegue" {
                if let destinationController = segue.destination as? SubmitRatingViewController {
                    destinationController.minValue = minRating
                    destinationController.MaxValue = maxRating
                    resetData()
                }
            }
        } else {
            showAlert(withTitle: "", alertMessage: "Please set Min and Max rating")
        }
    }
}

//MARK: Textfield delegate method
extension RatingViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newLength = (textField.text?.count ?? 0) + string.count - range.length
        if textField == minRatingTxtField {
          minRating = Int(string)
        }
        if textField == maxRatingTxtField {
            maxRating = Int(string)
        }
        ratingButton.setTitle("Rating \(minRating ?? 0)-\(maxRating ?? 9)", for: .normal)
        return newLength < 2
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        showMaxRatingAlert()
    }
}
