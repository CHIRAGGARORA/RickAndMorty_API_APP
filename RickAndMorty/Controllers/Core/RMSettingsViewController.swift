//
//  RMSettingsViewController.swift
//  RickAndMorty
//
//  Created by chirag arora on 26/12/22.
//

import StoreKit
import SafariServices
import UIKit
import SwiftUI

/// Controller to show various app options and settings
final class RMSettingsViewController: UIViewController {
    
    
    
    private var settingsSwiftUIController: UIHostingController<RMSettingsView>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        view.backgroundColor = .systemBackground
        title = "Settings"
        addswiftUIController()
        
    }
    
    private func addswiftUIController() {
        let settingsSwiftUIController = UIHostingController(
            rootView: RMSettingsView(viewModel:  RMSettingsViewViewModel(
                cellViewModels: RMSettingsOption.allCases.compactMap({
                    return RMSettingsCellViewModel(type: $0) { [weak self] option in
                        self?.handleTap(option: option)
                    }
                })
            )
            )
        )
        addChild(settingsSwiftUIController)
        
        settingsSwiftUIController.didMove(toParent: self)
        
        view.addSubview(settingsSwiftUIController.view)
        settingsSwiftUIController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            settingsSwiftUIController.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            settingsSwiftUIController.view.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            settingsSwiftUIController.view.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            settingsSwiftUIController.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            
        ])
        
        self.settingsSwiftUIController = settingsSwiftUIController
    }
    
    private func handleTap(option: RMSettingsOption) {
        guard Thread.current.isMainThread else {
            return
        }
        
        if let url = option.targetUrl {
            // OPen Website
            let vc = SFSafariViewController(url: url)
            present(vc, animated: true)
            
        } else if option == .rateApp {
            // show rating prompt
            if let windowScene = view.window?.windowScene {
                SKStoreReviewController.requestReview(in: windowScene)
            }
        }
        
        
    }
    
    
    
}
