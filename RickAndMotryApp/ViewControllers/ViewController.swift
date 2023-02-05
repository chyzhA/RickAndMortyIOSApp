//
//  ViewController.swift
//  RickAndMotryApp
//
//  Created by Artem Chyzh on 01.02.2023.
//

import UIKit

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setupSubViews()
        getData()
    }

    private func setupSubViews() {
        
    }
    
    private func populateData() {
        
    }

    private func getData(){
        
        NetworkManager.fetchCharacters(from: NetworkManager.ServerURL.charactersURLp1) { [weak self] charactersObj in
            DispatchQueue.main.async {
                self?.populateData()
            }
        }
    }
}

