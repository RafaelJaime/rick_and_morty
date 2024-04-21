//
//  CharactersViewModel.swift
//  RickMorty
//
//  Created by Rafael on 20/4/24.
//

import Foundation

class CharactersViewModel: ObservableObject {
    
    @Published var currentState: ViewState<CharactersModel> = .idle
    @Published var searchText: String = ""
    private var charactersGetUseCase: CharactersGetUseCase
    
    init(charactersGetUseCase: CharactersGetUseCase = CharactersGetUseCase()) {
        self.charactersGetUseCase = charactersGetUseCase
    }
}

extension CharactersViewModel {
    
    public func onAppear() {
        // Analitica
        Task {
            await getCharacters()
        }
    }
    
    public func onDissappear() {
        // Analitica
    }
    
}

extension CharactersViewModel {
    
    private func getCharacters() async {
        currentState = .loading
        do {
            currentState = .success(CharactersModel(itemsBO: try await charactersGetUseCase.execute()))
        } catch {
            currentState = .error(error.localizedDescription)
        }
    }
    
}
