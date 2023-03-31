//
//  PhotoCollectionViewCell.swift
//  Navigation
//
//  Created by Marat Guseynov on 14.03.2023.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    var collectionImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemGray2
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        contentView.addSubview(collectionImage)
        
        NSLayoutConstraint.activate([
            collectionImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }    
}

extension UIView {
    static var identifier : String {
        String(describing: self)
    }
}
