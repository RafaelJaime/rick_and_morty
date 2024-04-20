//
//  CharacterModel.swift
//  RickMorty
//
//  Created by Rafael on 20/4/24.
//

import Foundation

class CharacterModel: Identifiable {
    private let itemBO: CharacterBO
    
    init(itemBO: CharacterBO) {
        self.itemBO = itemBO
    }
    
    public var name: String {
        itemBO.name
    }
    
    public var imageURL: URL? {
        URL(string: itemBO.image ?? "")
    }
}
