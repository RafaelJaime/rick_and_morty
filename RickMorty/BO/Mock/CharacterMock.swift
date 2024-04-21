//
//  CharacterMock.swift
//  RickMorty
//
//  Created by Rafael on 20/4/24.
//

import Foundation

extension CharacterBO {
    static var mock1 = CharacterBO(id: -1, name: "Nombre Mockeado", status: .alive, species: .alien, type: nil, gender: .male, image: "https://rickandmortyapi.com/api/character/avatar/18.jpeg", episode: [], url: "https://rickandmortyapi.com/api/character/18", created: "2017-11-04T22:25:29.008Z".toDate())
}
