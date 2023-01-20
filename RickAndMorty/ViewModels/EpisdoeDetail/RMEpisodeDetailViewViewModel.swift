//
//  RMEpisodeDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by chirag arora on 13/01/23.
//

import UIKit

protocol RMEpisodeDetailViewViewModelDelegate: AnyObject {
    func didFetchEpisodeDetails()
}

final class RMEpisodeDetailViewViewModel{
    private let endpointUrl: URL?
    private var dataTuple: (episode: RMEpisode, characters: [RMCharacter])? {
        didSet {
            createCellViewModels()
            delegate?.didFetchEpisodeDetails()
        }
    }
    
    enum sectionType {
        case information(viewModels: [RMEPisodeInfoCollectionViewCellViewModel])
        case characters(viewModel: [RMCharacterCollectionViewCellViewModel])
        
    }
    
    public weak var delegate: RMEpisodeDetailViewViewModelDelegate?
    
    public private(set) var cellViewModels: [sectionType] = []
    
    
    
    //MARK: - Init
    
    
    
    init (endpointUrl: URL?) {
        self.endpointUrl = endpointUrl
        
        
    }
    
    
    // MARK: - private
    
    private func createCellViewModels() {
        guard let dataTuple = dataTuple else {
            return
        }
        let episode = dataTuple.episode
        let characters = dataTuple.characters
        cellViewModels = [
            .information(viewModels: [
                .init(title: "Episode Name", value: episode.name),
                .init(title: "Air Date", value: episode.air_date),
                .init(title: "Episode ", value: episode.episode),
                .init(title: "Created", value: episode.created),
                
            ]),
            .characters(viewModel: characters.compactMap({ character in
                return RMCharacterCollectionViewCellViewModel(charactername: character.name,
                                                              characterStatus: character.status, characterImageurl: URL(string: character.image))
                
            }) )
        ]
    }
    
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
            case .failure:
                break
            }
            
        }
    }
    
    private func fetchRelatedCharacters(episode: RMEpisode) {
        let requests: [RMRequest] = episode.characters.compactMap({
            return URL(string: $0)
        }).compactMap({
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
                episode: episode,
                characters: characters
            )
        }
        
        
    }
}
