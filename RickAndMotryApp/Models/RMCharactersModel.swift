//
//  RMCharactersModel.swift
//  RickAndMotryApp
//
//  Created by Artem Chyzh on 01.02.2023.
//

import Foundation

struct RMCharactersModel: Codable {
    let info: RMInfoSection
    let results: [RMCharacter]
}
