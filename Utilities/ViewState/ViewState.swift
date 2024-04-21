//
//  ViewState.swift
//  RickMorty
//
//  Created by Rafael on 20/4/24.
//

import Foundation

enum ViewState<T: Any> {
    case idle
    case loading
    case success(_ item: T)
    case error(_ error: String)
}
