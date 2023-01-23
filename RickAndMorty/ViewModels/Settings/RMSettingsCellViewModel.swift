//
//  RMSettingsCellViewModel.swift
//  RickAndMorty
//
//  Created by chirag arora on 23/01/23.
//

import UIKit


struct RMSettingsCellViewModel: Identifiable, Hashable {
    let id = UUID()
    
    
    private var type: RMSettingsOption
    
    // MARK: - Init
    
    init(type: RMSettingsOption) {
        self.type = type
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
