//
//  CharacterListViewViewModel.swift
//  RickAndMorty
//
//  Created by chirag arora on 30/12/22.
//

import UIKit


final class RMCharacterListViewViewModel: NSObject  {
    func fetchCharacters() {
        RMService.shared.execute(.listCharactersrequest,
                                 expecting: RMGetAllCharactersResponse.self)
        { result in
            switch result {
            case .success(let model):
                print("Example Image url: "+String(model.results.first?.image ?? "No Image"))
                
             
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}


extension RMCharacterListViewViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: RMCharacterCollectionViewCell.cellIdentifier,
            for: indexPath
        ) as? RMCharacterCollectionViewCell else {
            fatalError("Unsupported cell")
            
        }
        let viewModel = RMCharacterCollectionViewCellViewModel(charactername: "Chirag",
                                                               characterStatus: .alive, characterImageurl: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"))
        cell.configure(with: viewModel)
       
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let bounds = UIScreen.main.bounds
        let width = (bounds.width-30)/2
       
        return CGSize(
            width: width,
            height: width * 1.5)
    }
}
