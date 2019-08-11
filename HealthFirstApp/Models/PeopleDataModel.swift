//
//  PeopleDataModel.swift
//  HealthFirstApp
//
//  Created by Donkemezuo Raymond Tariladou on 8/11/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import Foundation


struct PeopleData: Codable {
    
    let results: [PeopleDataWrapper]
    
}

struct PeopleDataWrapper: Codable {
    let name: String
    let height: String
    let mass: String
    let hair_color: String?
    let skin_color: String?
    let eye_color: String?
    let birth_year: String?
    let gender: String
    let homeworld: String
    let created: String?
    
     enum CodingKeys: String, CodingKey {
        case name
        case height
        case mass
        case gender
        case homeworld
        case hair_color = "hairColor"
        case skin_color = "skinColor"
        case eye_color = "eyeColor"
        case birth_year = "birthYear"
        case created = "createdDate"
        
    }
}
