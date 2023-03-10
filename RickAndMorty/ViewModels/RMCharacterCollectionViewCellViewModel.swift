//
//  RMCharacterCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by chirag arora on 30/12/22.
//

import Foundation




final class RMCharacterCollectionViewCellViewModel: Hashable , Equatable{
   
    
    
    
    
    public let charactername: String
    private let characterStatus: RMCharacterStatus
    private let characterImageurl: URL?
    

    
    // MARK: - Init
    
    init(charactername: String,
         characterStatus: RMCharacterStatus,
         characterImageurl: URL?
         
         
         
         
    ) {
        self.charactername = charactername
        self.characterStatus = characterStatus
        self.characterImageurl = characterImageurl
    }
    
    
    public var characterStatusText: String {
        return "Status: \(characterStatus.text)"
    }
    
    public func fetchImage(completion: @escaping(Result<Data, Error>) -> Void)  {
        //TODO: Abstract to Image Manager
        guard let url = characterImageurl else {
            completion(.failure(URLError(.badURL)))
            return
        }
        RMImageLoader.shared.downloadImage(url, completion: completion)
    }
    
    // MARK:- Hashable
    
    static func == (lhs: RMCharacterCollectionViewCellViewModel, rhs: RMCharacterCollectionViewCellViewModel) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(charactername)
        hasher.combine(characterStatus)
        hasher.combine(characterImageurl)
    }
    
    
}
