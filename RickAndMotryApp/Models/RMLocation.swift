//
//  RMLocation.swift
//  RickAndMotryApp
//
//  Created by Artem Chyzh on 01.02.2023.
//

import Foundation

struct RMLocation {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [RMCharacter]
    let url: String
    let created: String
}
