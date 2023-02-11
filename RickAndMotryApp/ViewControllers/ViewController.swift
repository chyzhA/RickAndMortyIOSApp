//
//  ViewController.swift
//  RickAndMotryApp
//
//  Created by Artem Chyzh on 01.02.2023.
//

import UIKit

final class ViewController: UIViewController {

    private let collectionOfCharacters = UICollectionView(frame: .zero,
                                                          collectionViewLayout: UICollectionViewFlowLayout())
    private let appLabel: UILabel = {
        let label = UILabel()
        label.text = "Rick and Morty"
        return label
    }()
    
    private var modelObject: RMCharacter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionOfCharacters.frame = view.bounds
        view.backgroundColor = .systemBackground
        
        setupSubViews()
        addConstraints()
        //getData()
    }

    private func setupSubViews() {
        
        guard let layout = collectionOfCharacters.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        
        let itemSize = collectionOfCharacters.bounds.width / 3 - 8
        
        layout.itemSize = .init(width: itemSize, height: itemSize + 30)
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 2
        layout.scrollDirection = .vertical
        
        collectionOfCharacters.register(RMCollectionCell.self,
                                        forCellWithReuseIdentifier: "cell")
        collectionOfCharacters.delegate = self
        collectionOfCharacters.dataSource = self
        
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

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionOfCharacters.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        (cell as? RMCollectionCell)?.setImage(with: "person")
        (cell as? RMCollectionCell)?.setName(withName: "Rick Sanchez")
        
        return cell
        
    }
    
    
}
