//
//  HistoryViewController.swift
//  RatingDemo
//
//  Created by Mayanshi Gupta on 19/05/20.
//  Copyright © 2020 Stamurai. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {
  
    @IBOutlet weak var contentTableView: UITableView!
    let screenWidth = UIScreen.main.bounds.width
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        contentTableView.reloadData()
    }
}

extension HistoryViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        let count = DBManager.sharedInstance.getDataFromDB().count
        if count > 0 {
            tableView.separatorStyle = .singleLine
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =  tableView.dequeueReusableCell(withIdentifier: "historyCell", for: indexPath) as? HistoryTableViewCell else { return UITableViewCell() }

        let item = DBManager.sharedInstance.getDataFromDB().reversed()[indexPath.row] as Rating
        cell.creationTime.text = item.createdTime.getStringFromDate()
        //remove subviews from stack views
        for view in cell.feedbackStack.subviews  {
            cell.feedbackStack.removeArrangedSubview(view)
        }
        
        for _ in 0..<item.rating {
            cell.feedbackStack.addArrangedSubview(getImageView())
        }
        return cell
    }
    
    func getImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit // image will never be strecthed vertially or horizontally
        imageView.image = #imageLiteral(resourceName: "star")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        //set imageview constraint
        let imageViewWidthConstraint =
            NSLayoutConstraint(item: imageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute:
                .notAnAttribute, multiplier: 1, constant: screenWidth * 0.10)
        imageView.addConstraints([imageViewWidthConstraint])
        return imageView
    }
}
