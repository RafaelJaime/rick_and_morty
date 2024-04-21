//
//  CharacterView.swift
//  RickMorty
//
//  Created by Rafael on 20/4/24.
//

import SwiftUI
import Kingfisher

struct CharacterView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
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
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action : {
            presentationMode.wrappedValue.dismiss()
        }){
            Image(systemName: "arrowshape.backward.fill")
                .foregroundColor(Color.white)
        })
        .navigationTitle(character.name)
    }
    
    var characterView: some View {
        VStack(spacing: 0) {
            switch viewModel.currentState {
            case .idle:
                Text("")
            case .loading:
                LoadingView()
            case .success(_):
                GeometryReader { geometry in
                    ScrollView {
                        VStack(spacing: 0) {
                            KFImage(character.imageURL)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(RoundedRectangle(cornerRadius: 2))
                                .overlay(alignment: .topTrailing) {
                                }
                            characterDescription
                            Spacer()
                            if let creationDate = character.creationDate {
                                bottomDescription(creationDate: creationDate)
                            }
                        }
                        .frame(maxWidth: .infinity, minHeight: geometry.size.height)
                    }
                }
            case .error(let errorMessage):
                Text("Ha ocurrido un error! \n (\(errorMessage))")
            }
        }
    }
}

extension CharacterView {
    
    var characterDescription: some View {
        VStack(alignment: .leading, spacing: 10) {
            if let episodesNumber = character.episodesNumber {
                Text("Apariciones en la serie: \(episodesNumber)")
            }
            ScrollView(.horizontal) {
                HStack(spacing: 3) {
                    if let speciesColor = character.speciesColor {
                        listItem(name: character.speciesName, color: speciesColor)
                    }
                    if let genderColor = character.genderColor {
                        listItem(name: character.genderName, color: genderColor, foreground: character.genderForeground)
                    }
                    if let statusColor = character.statusColor {
                        listItem(image: character.statusName, color: statusColor, foreground: character.statusForeground)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 20)
        .padding(.vertical, 30)
        .background(Color.yellowRM)
    }
    
    func listItem(name: String, color: Color, foreground: Color? = nil) -> some View {
        Text(name)
            .foregroundColor(foreground ?? .white)
            .padding(4)
            .padding(.horizontal, 4)
            .background {
                Capsule()
                    .fill(color)
            }
    }
    
    func listItem(image: Image, color: Color, foreground: Color? = nil) -> some View {
        image
            .foregroundColor(foreground ?? .white)
            .tint(foreground ?? .white)
            .padding(4)
            .padding(.horizontal, 4)
            .background {
                Capsule()
                    .fill(color)
            }
    }
    
    func bottomDescription(creationDate: String) -> some View {
        Text("Ultima actualizacion \(creationDate)")
            .font(.subheadline)
            .foregroundStyle(Color.white)
            .padding()
            .background(Color.brownRM)
            .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}

#Preview {
    CharacterView(character: CharacterModel(itemBO: CharacterBO.mock1))
}
