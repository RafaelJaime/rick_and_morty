//
//  CharactersBO.swift
//  RickMorty
//
//  Created by Rafael on 20/4/24.
//

import Foundation

struct CharacterBO: Decodable {
    
    let id: Int
    let name: String
    let status: CharacterStatus?
    let species: CharacterSpecies?
    let type: String?
    let gender: CharacterGender?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: Date?
    
}

enum CharacterGender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

enum CharacterSpecies: String, Codable {
    case alien = "Alien"
    case human = "Human"
}

enum CharacterStatus: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}
