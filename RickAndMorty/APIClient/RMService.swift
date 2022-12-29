//
//  RMService.swift
//  RickAndMorty
//
//  Created by chirag arora on 28/12/22.
//

import Foundation


final class RMService {
    static let shared = RMService()
    
    
    /// Privatized constructor
    
    private init() {}
    
    
    /// Send Rick and Morty API Call
    /// - Parameters:
    ///   - request: request instance
    ///   - type: The type of Object we expect to get back
    ///   - completion: callback with data or error
    public func execute<T: Codable>(
        _ request: RMRequest,
        expecting type: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
            
    }
}
