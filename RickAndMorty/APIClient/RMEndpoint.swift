//
//  RMEndpoint.swift
//  RickAndMorty
//
//  Created by chirag arora on 28/12/22.
//

import Foundation



/// Represents unique API Endpoint
@frozen enum RMEndpoint: String,CaseIterable, Hashable {
    
    case character
    case episode
    case location
}
