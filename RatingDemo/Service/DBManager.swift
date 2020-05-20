//
//  DBManager.swift
//  RatingDemo
//
//  Created by Mayanshi Gupta on 20/05/20.
//  Copyright © 2020 Stamurai. All rights reserved.
//

import Foundation
import RealmSwift

class DBManager {
    private var database:Realm
    static let sharedInstance = DBManager()
    private init() {
       database = try! Realm()
    }
    func getDataFromDB() ->  Results<Rating> {
      let results: Results<Rating> =  database.objects(Rating.self)
      return results
     }
    
     func addData(object: Rating)   {
          try! database.write {
             database.add(object)
             print("Added new object")
          }
     }
}
