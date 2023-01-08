//
//  RMCharacterPhotoCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by chirag arora on 07/01/23.
//

import Foundation


final class RMCharacterPhotoCollectionViewCellViewModel {
    private let ImageUrl: URL?
    
    init(ImageUrl: URL?) {
        self.ImageUrl = ImageUrl
    }
    
    public func fetchImage(completion: @escaping (Result<Data, Error>) -> Void) {
        guard let ImageUrl = ImageUrl else {
            completion(.failure(URLError(.badURL)))
            return
        }
        RMImageLoader.shared.downloadImage(ImageUrl, completion: completion)
    }
    
}
