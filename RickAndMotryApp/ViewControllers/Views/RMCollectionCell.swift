//
//  RMCollectionCell.swift
//  RickAndMotryApp
//
//  Created by Artem Chyzh on 11.02.2023.
//

import UIKit

class RMCollectionCell: UICollectionViewCell {
    
    private let characterPhoto = UIImageView()
    private let characterNameLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubViews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .secondarySystemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubViews() {
        
        contentView.addSubview(characterPhoto)
        contentView.addSubview(characterNameLabel)
        setupConstraints()
        
    }
    
    private func setupConstraints() {
        
        characterPhoto.translatesAutoresizingMaskIntoConstraints = false
        characterNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            characterPhoto.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            characterPhoto.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            characterPhoto.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
            characterPhoto.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -35),
            
            characterNameLabel.topAnchor.constraint(equalTo: characterPhoto.bottomAnchor),
            characterNameLabel.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            characterNameLabel.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
            characterNameLabel.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
    
}

extension RMCollectionCell {
    func setImage(with image: String) {
        
        characterPhoto.contentMode = .scaleAspectFit
        characterPhoto.clipsToBounds = true
        downloadImage(from: URL(string: image)!)
    }
    
    func setName(withName name: String) {
        characterNameLabel.text = "Name: \(name)"
        characterNameLabel.textColor = .label
        characterNameLabel.font = characterNameLabel.font.withSize(12)
        characterNameLabel.numberOfLines = 2
    }
    
    private func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    private func downloadImage(from url: URL) {
        print("Download Started")
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            // always update the UI from the main thread
            DispatchQueue.main.async() { [weak self] in
                self?.characterPhoto.image = UIImage(data: data)
            }
        }
    }
    
}
