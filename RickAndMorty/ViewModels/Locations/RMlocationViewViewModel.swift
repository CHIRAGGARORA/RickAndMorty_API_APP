//
//  RMlocationViewViewModel.swift
//  RickAndMorty
//
//  Created by chirag arora on 26/01/23.
//

import Foundation

protocol RMLocationViewViewModelDelegate: AnyObject {
    func didFetchInitialLocations()
}

final class RMlocationViewViewModel {
    
    
    weak var delegate: RMLocationViewViewModelDelegate?
    
    private var locations: [RMLocation] = [] {
        didSet {
            for location in locations {
                let cellViewModel = RMLocationTableViewCellsViewModel(location: location)
                if !cellViewModels.contains(cellViewModel) {
                    cellViewModels.append(cellViewModel)
                    
                }
            }
        }
    }
    
    //Location response info
    // will contain next url if present
    
    private var apiInfo: RMGetAllLocationsResponse.Info?
    
    public private(set) var cellViewModels: [RMLocationTableViewCellsViewModel] = []
    
    init() {}
    
    public func location(at index: Int) -> RMLocation? {
        guard index >= locations.count else {
            return nil
        }
        return self.locations[index]
    }
    
    public func fetchLocations() {
        RMService.shared.execute(
            .listLocationssRequest,
            expecting: RMGetAllLocationsResponse.self
        ) { [weak self] result in
            switch result {
            case .success(let model):
                self?.apiInfo = model.info
                self?.locations = model.results
                DispatchQueue.main.async {
                    self?.delegate?.didFetchInitialLocations()
                }
            case .failure(let error):
                break
            }
        }
    }
    
    private var hasMoreResults: Bool {
        return false
    }
}
