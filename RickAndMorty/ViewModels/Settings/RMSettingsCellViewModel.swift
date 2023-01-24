//
//  RMSettingsCellViewModel.swift
//  RickAndMorty
//
//  Created by chirag arora on 23/01/23.
//

import UIKit


struct RMSettingsCellViewModel: Identifiable{
    let id = UUID()
    
    
    public var type: RMSettingsOption
    public let onTapHandler: (RMSettingsOption) -> Void
    
    
    // MARK: - Init
    
    init(type: RMSettingsOption, onTapHandler: @escaping (RMSettingsOption) -> Void) {
        self.type = type
        self.onTapHandler = onTapHandler
    }
    
    // MARK: - Public
    
    // image | title
    public var image: UIImage? {
        return type.iconImage
    }
    public var title: String{
        return type.displayTitle
    }
    
    public var iconContainerColor: UIColor {
        return type.iconContainerColor
    }
    
    
}