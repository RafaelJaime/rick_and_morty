//
//  CharactersView.swift
//  RickMorty
//
//  Created by Rafael on 20/4/24.
//

import SwiftUI
import Kingfisher

struct CharactersView: View {
    
    @ObservedObject var viewModel = CharactersViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.lightBrownRM
                    .ignoresSafeArea()
                VStack(alignment: .center, spacing: 0) {
                    charactersView
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
    
    var charactersView: some View {
        VStack(spacing: 0) {
            switch viewModel.currentState {
            case .idle:
                Text("")
            case .loading:
                LoadingView()
            case .success(let item):
                ScrollView {
                    VStack(spacing: 0) {
                        viewTitle(item)
                        characterList(item)
                    }
                    .frame(maxWidth: .infinity)
                }
                
            case .error(let errorMessage):
                Text("Ha ocurrido un error! \n (\(errorMessage))")
            }
        }
    }
    
    func viewTitle(_ item: CharactersModel) -> some View {
        Text("Personajes de Rick y morty(\(item.count))")
            .font(.system(size: 20))
            .bold()
            .foregroundStyle(Color.paleBlueRM)
            .shadow(color: Color.greenRM, radius: 1, x: 1, y: 1)
            .padding(.vertical, 30)
    }
}

extension CharactersView {
    
    func characterList(_ item: CharactersModel) -> some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(item.characters) { character in
                NavigationLink {
                    CharacterView(character: character)
                } label: {
                    characterItem(character)
                }
                .buttonStyle(.plain)
            }
        }
    }
    
    func characterItem(_ character: CharacterModel) -> some View {
        HStack(alignment: .top) {
            KFImage(character.imageURL)
                .resizable()
                .frame(width: 80, height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 2))
            Text(character.name)
            Spacer()
        }
        .padding(10)
        .background(Color.white)
        .clipShape(
            RoundedRectangle(cornerRadius: 8)
        )
        .padding(.horizontal, 20)
    }
}

#Preview {
    CharactersView()
}
