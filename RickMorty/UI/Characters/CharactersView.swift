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
            TextField(text: $viewModel.searchText) {
                Text("Pulsa aqui para buscar")
                    .font(.subheadline)
            }
            .padding()
            .background(Color.yellowRM)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            ForEach(item.filterCharacters(searchText: viewModel.searchText)) { character in
                NavigationLink {
                    CharacterView(character: character)
                } label: {
                    characterItem(character)
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.horizontal, 20)
    }
    
    func characterItem(_ character: CharacterModel) -> some View {
        HStack(alignment: .top) {
            KFImage(character.imageURL)
                .resizable()
                .frame(width: 80, height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 2))
            VStack(alignment: .leading) {
                Text(character.name)
                if let speciesColor = character.speciesColor {
                    Text(character.speciesName)
                        .foregroundColor(.white)
                        .padding(4)
                        .padding(.horizontal, 4)
                        .background {
                            Capsule()
                                .fill(speciesColor)
                        }
                }
            }
            Spacer()
        }
        .padding(10)
        .background(Color.white)
        .clipShape(
            RoundedRectangle(cornerRadius: 8)
        )
    }
}

#Preview {
    CharactersView()
}
