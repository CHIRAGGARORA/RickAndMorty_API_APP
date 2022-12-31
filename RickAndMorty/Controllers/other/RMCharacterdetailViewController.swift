//
//  RMCharacterdetailViewController.swift
//  RickAndMorty
//
//  Created by chirag arora on 31/12/22.
//

import UIKit

/// Controller to show info about a single character
final class RMCharacterdetailViewController: UIViewController {
    private let viewModel: RMCharacterDetailViewViewModel
    init(viewModel: RMCharacterDetailViewViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    //MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = viewModel.title

       
    }
 

}
