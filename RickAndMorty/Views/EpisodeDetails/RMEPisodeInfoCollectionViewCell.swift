//
//  RMEPisodeInfoCollectionViewCell.swift
//  RickAndMorty
//
//  Created by chirag arora on 20/01/23.
//

import UIKit

final class RMEPisodeInfoCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "RMEPisodeInfoCollectionViewCell"
    
    private let titlelabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20,weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let valuelabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20,weight: .regular)
        label.textAlignment = .right
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubviews(titlelabel, valuelabel)
        setUpLayer()
        
        addConstraints()
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
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            titlelabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            titlelabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            titlelabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            
            valuelabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            valuelabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            valuelabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            
            titlelabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.47),
            valuelabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.47),
            
           
        ])
      
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titlelabel.text = nil
        valuelabel.text = nil
    }
    
    func configure(with viewModel: RMEPisodeInfoCollectionViewCellViewModel) {
        titlelabel.text = viewModel.title
        valuelabel.text = viewModel.value
        
    }
}
