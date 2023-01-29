//
//  RMLocationDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by chirag arora on 29/01/23.
//

import Foundation


protocol RMLocationDetailViewViewModelDelegate: AnyObject {
    func didFetchLocationDetails()
}

final class RMLocationDetailViewViewModel{
    private let endpointUrl: URL?
    private var dataTuple: (location: RMLocation, characters: [RMCharacter])? {
        didSet {
            createCellViewModels()
            delegate?.didFetchLocationDetails()
        }
    }
    
    enum sectionType {
        case information(viewModels: [RMEPisodeInfoCollectionViewCellViewModel])
        case characters(viewModel: [RMCharacterCollectionViewCellViewModel])
        
    }
    
    public weak var delegate: RMLocationDetailViewViewModelDelegate?
    
    public private(set) var cellViewModels: [sectionType] = []
    
    
    
    //MARK: - Init
    
    
    
    init (endpointUrl: URL?) {
        self.endpointUrl = endpointUrl
        
        
    }
    
    public func character(at index: Int) -> RMCharacter? {
        guard let dataTuple = dataTuple else {
            return nil
        }
        return dataTuple.characters[index]
    }
    
    
    // MARK: - private
    
    private func createCellViewModels() {
        guard let dataTuple = dataTuple else {
            return
        }
        let location = dataTuple.location
        let characters = dataTuple.characters
        
        var createdString = location.created
        if let date = RMCharacterInfoCollectionViewCellViewModel.dateFormatter.date(from: location.created) {
            createdString = RMCharacterInfoCollectionViewCellViewModel.shortDateFormatter.string(from: date)
        }
        
        cellViewModels = [
            .information(viewModels: [
                .init(title: "Location Name", value: location.name),
                .init(title: "Type", value: location.type),
                .init(title: "Dimension", value: location.dimension),
                .init(title: "Created", value: createdString),
                
            ]),
            .characters(viewModel: characters.compactMap({ character in
                return RMCharacterCollectionViewCellViewModel(charactername: character.name,
                                                              characterStatus: character.status, characterImageurl: URL(string: character.image))
                
            }) )
        ]
    }
    
    /// Fetch backing location model
    public func fetchLocationData() {
        guard let url = endpointUrl,
              let request = RMRequest(url: url) else {
            return
        }
        
        RMService.shared.execute(request, expecting: RMLocation.self) { [weak self ] result in
            switch result {
            case .success(let model):
                
                self?.fetchRelatedCharacters(location: model)
            case .failure:
                break
            }
            
        }
    }
    
    private func fetchRelatedCharacters(location: RMLocation) {
        let requests: [RMRequest] = location.residents.compactMap({
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
                location: location,
                characters: characters
            )
        }
        
        
    }
}

