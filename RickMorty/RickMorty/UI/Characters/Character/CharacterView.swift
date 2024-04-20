//
//  CharacterView.swift
//  RickMorty
//
//  Created by Rafael on 20/4/24.
//

import SwiftUI

struct CharacterView: View {
    
    @ObservedObject var viewModel = CharacterViewModel()
    var character: CharacterModel
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.lightBrownRM
                    .ignoresSafeArea()
                VStack(alignment: .center, spacing: 0) {
                    characterView
                }
            }
            .onAppear {
                viewModel.onAppear()
            }
            .onDisappear {
                viewModel.onDissappear()
            }
        }
    }
    
    var characterView: some View {
        VStack(spacing: 0) {
            switch viewModel.currentState {
            case .idle:
                Text("")
            case .loading:
                LoadingView()
            case .success(let item):
                ScrollView {
                    VStack(spacing: 0) {
                        Text("Estas viendo El detalle de \(character.name)")
                            .font(.title)
                    }
                    .frame(maxWidth: .infinity)
                }
                
            case .error(let errorMessage):
                Text("Ha ocurrido un error! \n (\(errorMessage))")
            }
        }
    }
}

#Preview {
    CharacterView(character: CharacterModel(itemBO: CharacterBO.mock1))
}
