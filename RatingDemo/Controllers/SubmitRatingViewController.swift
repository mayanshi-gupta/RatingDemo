//
//  SubmitRatingViewController.swift
//  RatingDemo
//
//  Created by Mayanshi Gupta on 19/05/20.
//  Copyright © 2020 Stamurai. All rights reserved.
//

import UIKit

class SubmitRatingViewController: UIViewController {

    @IBOutlet weak var ratingLbl: UILabel!
    @IBOutlet weak var ratingSlider: UISlider!
    var minValue: Int?
    var MaxValue: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setSlider()
    }
    
    func setSlider() {
        ratingSlider.minimumValue = Float(minValue ?? 0)
        ratingSlider.maximumValue = Float(MaxValue ?? 9)
        ratingSlider.value = Float(MaxValue ?? 9)
        ratingLbl.text = "\(MaxValue ?? 9)"
    }
    
    @IBAction func ratingSliderChanged(_ sender: UISlider) {
        ratingLbl.text = "\(Int(sender.value))"
    }
    
    
    @IBAction func submitBtnTapped(_ sender: Any) {
        let ratingModel = Rating()
        ratingModel.rating = Int(ratingLbl.text ?? "0") ?? 0
        //add object to realm database
        DBManager.sharedInstance.addData(object: ratingModel)
        setSlider()
        showAlert(withTitle: "", alertMessage: "Feedback has been saved")
    }
}
