//
//  Programmers.swift
//  possePeople
//
//  Created by Ehsan Zaman on 2/21/17.
//  Copyright © 2017 Ehsan Zaman. All rights reserved.
//

import Foundation
import UIKit

class Programmer {
    
    var name: String
    var favoriteColor: String
    var isArtist: Bool
    var phone: String
    var weight: Float
    var age: String
    var picture: UIImageView
    
    init(name: String, favoriteColor: String, isArtist: Bool, phone: String, weight: Float, age: String,picture: UIImageView) {
        self.name = name
        self.favoriteColor = favoriteColor
        self.isArtist = isArtist
        self.phone = phone
        self.weight = weight
        self.age = age
        self.picture = picture
        
    }
    
    
}

