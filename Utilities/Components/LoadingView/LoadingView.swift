//
//  LoadingView.swift
//  RickMorty
//
//  Created by Rafael on 20/4/24.
//

import SwiftUI


struct LoadingView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(.circular)
    }
}
#Preview {
    LoadingView()
}
