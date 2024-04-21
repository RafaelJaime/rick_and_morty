//
//  CharactersGetUseCase.swift
//  RickMorty
//
//  Created by Rafael on 20/4/24.
//

import Foundation

class CharactersGetUseCase {
    
    private var rickMortyRepository: RickMortyRepository
    
    init(rickMortyRepository: RickMortyRepository = RickMortyRepository()) {
        self.rickMortyRepository = rickMortyRepository
    }
    
    func execute() async throws -> [CharacterBO] {
        try await rickMortyRepository.getCharacters()
    }
}
