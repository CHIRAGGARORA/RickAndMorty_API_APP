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
    private var optionMap: [RMSearchInputViewViewModel.DynamicOptions: String] = [:]
    private var searchText = ""
    
    
    private var optionMapUpdateBlock: (((RMSearchInputViewViewModel.DynamicOptions, String)) -> Void)?

    
    
    
    // MARK: - Init
    
    init(config: RMSearchViewController.Config) {
        self.config = config
    }

    
    //MARK: - Public
    
    public func executeSearch() {
        //Create request based on filters
        // send API call
        // Notify view of results, no results, error
        
        
         
    }
    
    public func set(query text: String) {
        self.searchText = text
    }
    
    public func set(value: String, for option: RMSearchInputViewViewModel.DynamicOptions) {
        optionMap[option] = value
        let tuple = (option, value)
        optionMapUpdateBlock?(tuple)
    }
    
    public func registerOptionChangeBlock(
        _ block: @escaping((RMSearchInputViewViewModel.DynamicOptions, String)) -> Void
    ){
        
        self.optionMapUpdateBlock = block
        
        
    }
}
