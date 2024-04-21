//
//  CharacterModel.swift
//  RickMorty
//
//  Created by Rafael on 20/4/24.
//

import SwiftUI

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
    
    public var episodesNumber: Int? {
        itemBO.episode?.count
    }
    
    public var speciesName: String {
        guard let species = itemBO.species else { return "" }
        switch species {
        case .alien:
            return "Alienigena"
        case .human:
            return "Humano"
        }
    }
    
    public var speciesColor: Color? {
        guard let species = itemBO.species else { return nil }
        switch species {
        case .alien:
            return Color.greenRM
        case .human:
            return Color.pinkRM
        }
    }
    
    public var genderName: String {
        guard let gender = itemBO.gender else { return "" }
        switch gender {
        case .female:
            return "F"
        case .male:
            return "M"
        case .unknown:
            return "?"
        }
    }
    
    public var genderColor: Color? {
        guard let gender = itemBO.gender else { return nil }
        switch gender {
        case .female:
            return Color.pink
        case .male:
            return Color.blue
        case .unknown:
            return Color.gray
        }
    }
    
    public var genderForeground: Color? {
        guard let gender = itemBO.gender else { return nil }
        switch gender {
        case .unknown:
            return Color.black
        default:
            return nil
        }
    }
    
    public var statusName: Image {
        guard let status = itemBO.status else { return Image(systemName: "person.fill.questionmark") }
        switch status {
        case .alive:
            return Image(systemName: "person.fill")
        case .dead:
            return Image(systemName: "cross.fill")
        case .unknown:
            return Image(systemName: "person.fill.questionmark")
        }
    }
    
    public var statusColor: Color? {
        guard let status = itemBO.status else { return nil }
        switch status {
        case .alive:
            return Color.green
        case .dead:
            return Color.black
        case .unknown:
            return Color.gray
        }
    }
    
    public var statusForeground: Color? {
        guard let status = itemBO.status else { return nil }
        switch status {
        case .unknown:
            return Color.white
        default:
            return nil
        }
    }
    
    public var creationDate: String? {
        guard let created = itemBO.created else { return nil }
        let formatter = DateFormatter()
                formatter.dateFormat = "d 'de' MMMM 'de' yyyy"
                formatter.locale = Locale(identifier: "es_ES") // Configura el idioma para que los nombres de los meses estén en español
                
        return formatter.string(from: created)
    }
}
