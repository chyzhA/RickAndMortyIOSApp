//
//  ViewController.swift
//  RickAndMotryApp
//
//  Created by Artem Chyzh on 01.02.2023.
//

import UIKit

final class ViewController: UIViewController {

    private var modelObject: RMCharacter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setupSubViews()
        getData()
    }

    private func setupSubViews() {
        
    }
    
    private func populateData() {
        print("!!!!!!")
    }

    private func getData(){
        
        NetworkManager.fetchCharacters(from: NetworkManager.ServerURL.charactersURLp1) { [weak self] charactersObj in
            self?.modelObject = charactersObj
            DispatchQueue.main.async {
                self?.populateData()
            }
        }
    }
}

