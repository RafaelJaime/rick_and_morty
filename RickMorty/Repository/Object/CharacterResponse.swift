//
//  CharactersRO.swift
//  RickMorty
//
//  Created by Rafael on 20/4/24.
//

import Foundation

struct CharactersResponse: Decodable {
    let results: [CharacterResponse]?
}

struct CharacterResponse: Decodable {
    let id: Int?
    let name: String?
    let status: String?
    let species: String?
    let type: String?
    let gender: String?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
}
