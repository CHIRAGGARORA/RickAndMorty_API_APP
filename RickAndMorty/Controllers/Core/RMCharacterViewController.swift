//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by chirag arora on 26/12/22.
//

import UIKit

final class RMCharacterViewController: UIViewController, RMCharacterListViewDelegate{
    
    private let characterListView = RMCharacterListView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "Characters"
        setUpView()
        addSearchButton()
        
      
    }
    
    private func addSearchButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(didTapSearch))

    }
    
    @objc
    private func didTapSearch() {
        let vc = RMSearchViewController(config: RMSearchViewController.Config(type: .character))
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func setUpView() {
        characterListView.delegate = self
        view.addSubview(characterListView)
        NSLayoutConstraint.activate([
            
            characterListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            characterListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            characterListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            characterListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        
        
        ])
        
    }
    
    //MARK: - RMCharacterListViewDelegate
    
    func rmCharacterListView(_ characterListView: RMCharacterListView, didSelectCharacter character: RMCharacter) {
        //Open Detail controller for that character
        let viewModel = RMCharacterDetailViewViewModel(character: character)
        let DetailVC = RMCharacterdetailViewController(viewModel: viewModel)
        DetailVC.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(DetailVC, animated: true)
    }
    

}
