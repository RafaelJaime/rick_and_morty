//
//  CharacterViewModel.swift
//  RickMorty
//
//  Created by Rafael on 20/4/24.
//

import Foundation

class CharacterViewModel: ObservableObject {
    
    @Published var currentState: ViewState<CharactersModel> = .idle
    
    init() {
    }
}

extension CharacterViewModel {
    
    public func onAppear() {
        // Analitica
    }
    
    public func onDissappear() {
        // Analitica
    }
    
}
