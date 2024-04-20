//
//  CharactersMapper.swift
//  RickMorty
//
//  Created by Rafael on 20/4/24.
//

import Foundation

extension CharacterResponse {
    func toBO() -> CharacterBO? {
        guard let id = self.id, let name = self.name else { return nil }
        
        return CharacterBO(id: id, name: name, status: CharacterStatus(rawValue: self.status ?? ""), species: CharacterSpecies(rawValue: self.species ?? ""), type: self.type, gender: CharacterGender(rawValue: self.gender ?? ""), image: self.image, episode: self.episode, url: self.url, created: self.created?.toDate())
    }
}
