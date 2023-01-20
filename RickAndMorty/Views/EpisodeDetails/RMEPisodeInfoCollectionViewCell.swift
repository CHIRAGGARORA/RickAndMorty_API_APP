//
//  RMEPisodeInfoCollectionViewCell.swift
//  RickAndMorty
//
//  Created by chirag arora on 20/01/23.
//

import UIKit

final class RMEPisodeInfoCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "RMEPisodeInfoCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        setUpLayer()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUpLayer() {
        layer.cornerRadius = 8
        layer.masksToBounds = true
        layer.borderWidth = 1
        layer.borderColor = UIColor.secondaryLabel.cgColor
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configure(with viewModel: RMEPisodeInfoCollectionViewCellViewModel) {
        
    }
}
