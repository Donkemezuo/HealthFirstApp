//
//  PeopleDataModel.swift
//  HealthFirstApp
//
//  Created by Donkemezuo Raymond Tariladou on 8/11/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import Foundation

struct PeopleData: Codable {
    let next: String?
    let results: [PeopleDataWrapper]
}

struct PeopleDataWrapper: Codable {
    let name: String
    let height: String
    let mass: String
    let hairColor: String?
    let skinColor: String?
    let eyeColor: String?
    let birthYear: String?
    let gender: String
    let homeworld: String
    let createdDate: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case height
        case mass
        case gender
        case homeworld
        case hairColor = "hair_color"
        case skinColor = "skin_color"
        case eyeColor = "eye_color"
        case birthYear = "birth_year"
        case createdDate = "created"
    }
}
