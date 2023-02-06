//
//  RMSearchViewController.swift
//  RickAndMorty
//
//  Created by chirag arora on 16/01/23.
//

import UIKit

//Dynamic search option
//Render Results
//Render nor results zero state
//Searching/ API Call


/// Configurable controller to search
final class RMSearchViewController: UIViewController {
    
    /// Configuration for search session
    struct Config {
        enum `Type` {
            case character
            case episode
            case location
            
            var title: String {
                switch self {
                case .character:
                    return "Search Characters"
                case .location:
                    return "Search Locations"
                case .episode:
                    return "Search Episodes"
                    
                }
            }
        }
        let type: `Type`
        
    }
    
  
    private let viewModel: RMSearchViewViewModel
    
    private let searchView: RMSearchView
    
    // MARK: - Init
    
    init(config: Config) {
       
        let viewModel = RMSearchViewViewModel(config: config)
        self.viewModel = viewModel
        self.searchView = RMSearchView(frame: .zero, viewModel: viewModel)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.config.type.title
        view.backgroundColor = .systemBackground
        view.addSubviews(searchView)
        addConstraints()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Search", style: .done, target: self, action: #selector(didTapExecuteSearch))
        
        searchView.delegate = self

   }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        searchView.presentKeyboard()
    }
    
    @objc
    private func didTapExecuteSearch() {
//        viewModel.executeSearch()
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            searchView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            searchView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            searchView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            
        ])
    }
    


}


//MARK: - RMSearchViewDelegate


extension RMSearchViewController: RMSearchViewDelegate {
    func rmSearchView(_ searchView: RMSearchView, didSelectOption option: RMSearchInputViewViewModel.DynamicOptions) {
        let vc = RMSearchOptionPickerViewController(option: option) { selection in
            print("Did select \(selection)")
        }
        vc.sheetPresentationController?.detents = [.medium()]
        vc.sheetPresentationController?.prefersGrabberVisible = true
        
        present(vc,animated: true)
        
    }
    
}
