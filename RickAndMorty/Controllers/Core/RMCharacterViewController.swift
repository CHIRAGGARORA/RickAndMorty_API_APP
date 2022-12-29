//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by chirag arora on 26/12/22.
//

import UIKit

final class RMCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "Characters"
        
        
        RMService.shared.execute(.listCharactersrequest,
                                 expecting: RMGetAllCharactersResponse.self)
        { result in
            switch result {
            case .success(let model):
                print("Total: "+String(model.info.pages))
                print("Page result count: "+String(model.results.count))
            case .failure(let error):
                print(String(describing: error))
            }
        }
      
    }
    

}
