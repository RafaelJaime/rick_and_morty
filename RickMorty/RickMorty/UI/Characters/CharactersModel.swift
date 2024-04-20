//
//  CharactersModel.swift
//  RickMorty
//
//  Created by Rafael on 20/4/24.
//

import Foundation

class CharactersModel {
    private let itemsBO: [CharacterBO]
    
    public init(itemsBO: [CharacterBO]) {
        self.itemsBO = itemsBO
    }
    
    public var count: String {
        "\(itemsBO.count)"
    }
    
    public var characters: [CharacterModel] {
        itemsBO.compactMap { CharacterModel(itemBO: $0) }
    }
}
