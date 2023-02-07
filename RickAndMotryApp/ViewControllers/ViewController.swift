//
//  ViewController.swift
//  RickAndMotryApp
//
//  Created by Artem Chyzh on 01.02.2023.
//

import UIKit

final class ViewController: UIViewController {

    private let collectionOfCharacters: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout.init())
        return collection
    }()
    
    private let appLabel: UILabel = {
        let label = UILabel()
        label.text = "Rick and Morty"
        return label
    }()
    
    private var modelObject: RMCharacter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setupSubViews()
        addConstraints()
        //getData()
    }

    private func setupSubViews() {
        
        view.addSubview(appLabel)
        view.addSubview(collectionOfCharacters)
        
    }
    
    private func addConstraints() {
        
        appLabel.translatesAutoresizingMaskIntoConstraints = false
        collectionOfCharacters.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            appLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                         constant: 8),
            appLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            collectionOfCharacters.topAnchor.constraint(equalTo: appLabel.bottomAnchor,
                                                       constant: 8),
            collectionOfCharacters.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                                           constant: 8),
            collectionOfCharacters.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            collectionOfCharacters.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                                                          constant: -8)
            
        ])
        
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

