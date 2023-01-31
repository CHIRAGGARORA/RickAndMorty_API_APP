//
//  RMSearchViewViewModel.swift
//  RickAndMorty
//
//  Created by chirag arora on 31/01/23.
//

import Foundation

//Responsibilities
//- show search results
//- show no results view
//- kick off API Requests


final class RMSearchViewViewModel {
    let config: RMSearchViewController.Config
    
    init(config: RMSearchViewController.Config) {
        self.config = config
    }
}
