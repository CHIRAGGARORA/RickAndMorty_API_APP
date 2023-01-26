//
//  RMlocationViewViewModel.swift
//  RickAndMorty
//
//  Created by chirag arora on 26/01/23.
//

import Foundation


final class RMlocationViewViewModel {
    
    private var locations: [RMLocation] = []
    
    //Location response info
    // will contain next url if present
    
    private var cellViewModels: [String] = []
    
    init() {}
    
    public func fetchLocations() {
        RMService.shared.execute(.listLocationssRequest, expecting: String.self) { result in
            switch result {
            case .success(let model):
                break
            case .failure(let error):
                break
            }
        }
    }
    
    private var hasMoreResults: Bool {
        return false
    }
}
