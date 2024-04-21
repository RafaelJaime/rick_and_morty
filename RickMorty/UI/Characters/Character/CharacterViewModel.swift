//
//  CharacterViewModel.swift
//  RickMorty
//
//  Created by Rafael on 20/4/24.
//

import Foundation

class CharacterViewModel: ObservableObject {
    
    @Published var currentState: ViewState<()> = .idle
    
    init() {
    }
}

extension CharacterViewModel {
    
    public func onAppear() {
        // Analitica
        currentState = .success(())
    }
    
    public func onDissappear() {
        // Analitica
    }
    
}
