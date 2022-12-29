//
//  RMCharacterStatus.swift
//  RickAndMorty
//
//  Created by chirag arora on 29/12/22.
//

import Foundation


enum RMCharacterStatus: String,Codable {
    case alive = "Alive"
    case dead = "Dead"
    case `unknown` = "unknown"
    // unknown is blue coz its a keyword in swift so backtick it
}

