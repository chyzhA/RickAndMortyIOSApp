//
//  RMCharacter.swift
//  RickAndMotryApp
//
//  Created by Artem Chyzh on 01.02.2023.
//

import Foundation


struct RMCharacter {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    
    // Gender - string or enum
    let gender: String
    
    let origin: RMLocation
    let location: RMLocation
    
    // Image string or Data
    let image: String
    
    // Episode - [String] or [RMEpisode]
    let episode: [String]
    
    let url: String
    let created: String
}
