//
//  RMEpisodeDetailViewController.swift
//  RickAndMorty
//
//  Created by chirag arora on 12/01/23.
//

import UIKit

/// VC to show details about single episode
final class RMEpisodeDetailViewController: UIViewController {
    
    
    
    private let viewModel: RMEpisodeDetailViewViewModel
    
    //MARK: - INit
    
    init(url: URL?) {
        self.viewModel = .init(endpointUrl: url)
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Episode"
        view.backgroundColor = .systemGreen

        
    }
    

   

}
