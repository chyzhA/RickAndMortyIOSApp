//
//  RMCharacter.swift
//  RickAndMotryApp
//
//  Created by Artem Chyzh on 01.02.2023.
//

import Foundation


struct RMCharacter: Codable {
    let id: Int
    let name: String
    let status: RMCharacterStatus
    let species: String
    let type: String
    
    // Gender - string or enum
    let gender: RMCharacterGender
    
    let origin: RMLocation
    let location: RMLocation
    
    // Image string or Data
    let image: String
    
    // Episode - [String] or [RMEpisode]
    let episode: [String]
    
    let url: String
    let created: String
}

enum RMCharacterStatus: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case `unknown` = "unknown"
}

enum RMCharacterGender: String, Codable {
    case female = "Female"
    case male = "Male"
    case genderless = "Genderless"
    case `unknown` = "unknown"
}
