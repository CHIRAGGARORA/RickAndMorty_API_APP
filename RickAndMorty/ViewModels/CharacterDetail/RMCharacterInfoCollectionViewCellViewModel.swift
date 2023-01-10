//
//  RMCharacterInfoCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by chirag arora on 07/01/23.
//

import Foundation
import UIKit


final class RMCharacterInfoCollectionViewCellViewModel {
    
    private let type: `Type`
    
    
    
    
    
    private let value: String
    
    
    static let dateFormatter: DateFormatter =  {
        // Format
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSZ"
        formatter.timeZone = .current
        
        return formatter
    }()
    
    static let shortDateFormatter: DateFormatter =  {
        // Format
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        
        
        return formatter
    }()
    
    
    
    
    
    
    
    public var title: String {
        type.displayTitle
    }
    
    public var displayValue : String {
        if value.isEmpty { return "None" }
        
     
        
        
        if let date = Self.dateFormatter.date(from: value),
           type == .created {
            return Self.shortDateFormatter.string(from: date)
            
            
        }
        
        return value
    }
    
    public var iconImage: UIImage? {
        return type.iconImage
    }
    
    
    public var tintColor: UIColor {
        return type.tintColor
    }
    
    
    
    
    
    enum `Type`: String {
        case status
        case gender
        case type
        case species
        case origin
        case location
        case created
        case episodeCount
        
        var tintColor: UIColor {
            switch self {
            case .status: return .systemRed
            case .gender: return .systemBlue
            case .type: return .systemCyan
            case .species: return .systemFill
            case .origin: return .systemGray
            case .location: return .systemGreen
            case .created: return .systemMint
            case .episodeCount: return .systemPink
            }
        }
        
        var iconImage: UIImage? {
            switch self {
            case .status: return UIImage(systemName: "bell")
            case .gender: return UIImage(systemName: "bell")
            case .type: return UIImage(systemName: "bell")
            case .species: return UIImage(systemName: "bell")
            case .origin: return UIImage(systemName: "bell")
            case .location: return UIImage(systemName: "bell")
            case .created: return UIImage(systemName: "bell")
            case .episodeCount: return UIImage(systemName: "bell")
            }
        }
        
        var displayTitle: String {
            
            
            
            switch self {
            case  .status,
                    .gender,
                    .type,
                    .species,
                    .origin,
                    .created,
                    .location:
                return rawValue.uppercased()
                    
            case .episodeCount:
                return "EPISODE COUNT"
            }
            
        }
    }
    
    
    
    
    
    init(type: `Type`, value: String    ) {
        
        
        
        self.value = value
        self.type = type
    }
}
