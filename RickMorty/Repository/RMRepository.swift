//
//  RMRepository.swift
//  RickMorty
//
//  Created by Rafael on 20/4/24.
//

import Foundation
import Alamofire

class RickMortyRepository {
    
    func getCharacters() async throws -> [CharacterBO] {
        let response = AF.request(RMRepositoryURL.characters, method: .get).validate().serializingDecodable(CharactersResponse.self)
        
        
        guard let result = try await response.value.results else { throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: [], debugDescription: "Invalid response")) }
        
        return result.compactMap { $0.toBO() }
    }

}
