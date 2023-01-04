//
//  RMCharacterDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by chirag arora on 31/12/22.
//

import Foundation

final class RMCharacterDetailViewViewModel {
    private let character: RMCharacter
    init(character: RMCharacter) {
        self.character = character
    }
    
    private var requestUrl: URL? {
        return URL(string: character.url)
    }
    
    public  var title: String {
        character.name.uppercased()
    }
    

}
