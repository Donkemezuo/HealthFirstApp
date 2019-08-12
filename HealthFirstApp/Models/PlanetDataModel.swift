//
//  PlacesDataModel.swift
//  HealthFirstApp
//
//  Created by Donkemezuo Raymond Tariladou on 8/11/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import Foundation

struct PlanetData: Codable {
    let results: [PlanetDataWrapper]
    let next: String
}

struct PlanetDataWrapper: Codable {
    let name: String
    let rotation_period: String?
    let orbital_period: String?
    let population: String
    let climate: String
    let created: String?
    let terrain: String
    let surface_water: String?
    let gravity: String
    let diameter: String
//
//    enum CodingKeys: String,CodingKey {
//        case name
//        case rotationPeriod = "rotation_period"
//        case orbitalPeriod = "orbital_period"
//        case population
//        case climate
//        case created = "createdDate"
//        case createdDate = "created"
//        case terrain
//        case surfaceWater = " surface_water"
//        case gravity
//        case diameter
//    }
    
    enum CodingKeys: String,CodingKey {
        case name
        case rotation_period = "rotationPeriod"
        case orbital_period = "orbitalPeriod"
        case population
        case climate
        case created = "createdDate"
        case terrain
        case surface_water = "surfaceWater"
        case gravity
        case diameter
    }
}
