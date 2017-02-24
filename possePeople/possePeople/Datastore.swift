//
//  datastore.swift
//  possePeople
//
//  Created by Ehsan Zaman on 2/21/17.
//  Copyright © 2017 Ehsan Zaman. All rights reserved.
//

import Foundation
import SwiftyJSON


class datastore {
    
    static let sharedInstance = datastore()
    
    func parseFile(array: [Programmer]) -> [Programmer]{
        var array = array
        let path: String = Bundle.main.path(forResource: "ios_model_challenge", ofType: "json") as String!
        
        let data = NSData(contentsOfFile: path) as Data!
        let readableJSON = JSON(data: data!, options: .mutableContainers, error: nil)
        let locationArray = readableJSON["response"]["locations"]
        
        for location in locationArray {
            
            let servicesPerLocation = location.1["services"]
            for service in servicesPerLocation {
                let programmers = service.1
                
                for programmer in programmers {
                    let employees = programmer.1
                    
                    for employee in employees {
                        let person = employee.1
                        let personName = person["name"].stringValue
                        let personAge = person["age"].stringValue
                        let personNumber = person["phone"].stringValue
                        let personFaveColor = person["favorite_color"].stringValue
                        let personArtist = person["is_artist"].boolValue
                        let personWeight = person["weight"].floatValue
                        
                        let picture = UIImageView()
                        
                        switch personName {
                        case "Albert" :
                            picture.image = #imageLiteral(resourceName: "albert")
                        case "David":
                            picture.image = #imageLiteral(resourceName: "david")
                        case "Federico":
                            picture.image = #imageLiteral(resourceName: "federico")
                        case "Henry":
                            picture.image = #imageLiteral(resourceName: "henry")
                        case "Joe":
                            picture.image = #imageLiteral(resourceName: "joe")
                        case "Kevin":
                            picture.image = #imageLiteral(resourceName: "kevin")
                        case "Luke":
                            picture.image = #imageLiteral(resourceName: "luke")
                        default:
                            picture.image = #imageLiteral(resourceName: "posse-logo")
                        }
                        
                        let developer = Programmer(name: personName, favoriteColor: personFaveColor, isArtist: personArtist, phone: personNumber, weight: personWeight, age: personAge, picture: picture)
                        
                        array.append(developer)
                        
                    }
                }
            }
        }
        return array
    }
    
}
