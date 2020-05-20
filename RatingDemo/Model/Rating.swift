//
//  Rating.swift
//  RatingDemo
//
//  Created by Mayanshi Gupta on 20/05/20.
//  Copyright © 2020 Stamurai. All rights reserved.
//

import Foundation
import RealmSwift

class Rating: Object {
    @objc dynamic var createdTime = Date()
    @objc dynamic var rating = 0
    
}

