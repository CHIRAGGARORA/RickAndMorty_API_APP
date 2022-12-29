//
//  RMService.swift
//  RickAndMorty
//
//  Created by chirag arora on 28/12/22.
//

import Foundation


final class RMService {
    static let shared = RMService()
    
    
    private init() {}
    
    public func execute(_ request: RMRequest, completion: @escaping () -> Void) {
        
    }
}
