//
//  RMEpisodeDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by chirag arora on 13/01/23.
//

import UIKit

protocol RMEpisodeDetailViewViewModelDelegate: AnyObject {
    func didFetchEpisodedetails()
}

final class RMEpisodeDetailViewViewModel{
    private let endpointUrl: URL?
    private var dataTuple: (RMEpisode, [RMCharacter])? {
        didSet {
            delegate?.didFetchEpisodedetails()
        }
    }
    
    weak var delegate: RMEpisodeDetailViewViewModelDelegate?
    
    
    
    //MARK: - Init
    
    
    
    init (endpointUrl: URL?) {
        self.endpointUrl = endpointUrl
        
        
    }
    
    // MARK: - public
    
    // MARK: - private
    
    /// Fetch backing episode model
    public func fetchEpisodeData() {
        guard let url = endpointUrl,
              let request = RMRequest(url: url) else {
            return
        }
        
        RMService.shared.execute(request, expecting: RMEpisode.self) { [weak self ] result in
            switch result {
            case .success(let model):
                
                self?.fetchRelatedCharacters(episode: model)
            case .failure(let failure):
                break
            }
            
        }
    }
    
    private func fetchRelatedCharacters(episode: RMEpisode) {
        let characterUrls: [URL] = episode.characters.compactMap({
            return URL(string: $0)
        })
        let requests: [RMRequest] = characterUrls.compactMap({
            return RMRequest(url: $0)
        })
        
        
        // any number of parallel requests
        
        // Noified when its done
        
        
        let group = DispatchGroup()
        var characters: [RMCharacter] = []
        for request in requests{
            group.enter() // +1
            RMService.shared.execute(request, expecting: RMCharacter.self) { result in
                defer{ // defer means it is last thing to run before execution of our program
                    group.leave() // -1
                }
                switch result {
                case .success(let model):
                    characters.append(model)
                case.failure:
                    break
                    
                    
                }
            }
        }
        
        group.notify(queue: .main) {
            self.dataTuple = (
                episode,
                characters
            )
        }
        
        
    }
}
