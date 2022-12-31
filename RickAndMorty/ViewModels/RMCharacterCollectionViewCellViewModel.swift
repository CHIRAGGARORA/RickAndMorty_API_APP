//
//  RMCharacterCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by chirag arora on 30/12/22.
//

import Foundation




final class RMCharacterCollectionViewCellViewModel {
    
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
        return characterStatus.rawValue
    }
    
    public func fetchImage(completion: @escaping(Result<Data, Error>) -> Void)  {
        //TODO: Abstract to Image Manager
        guard let url = characterImageurl else {
            completion(.failure(URLError(.badURL)))
            return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? URLError(.badServerResponse)))
                return
                           
            }
            
            completion(.success(data))
            
            
        }
        
        task.resume()
    }
    
    
}
