//
//  RMLoactionViewController.swift
//  RickAndMorty
//
//  Created by chirag arora on 26/12/22.
//

import UIKit

final class RMLoactionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        view.backgroundColor = .systemBackground
        title = "Locations"
        addSearchButton()

     
    }
 
    
    private func addSearchButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(didTapSearch))

    }
    
    @objc
    private func didTapSearch() {
        
    }

}
