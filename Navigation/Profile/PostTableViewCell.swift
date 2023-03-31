//
//  TableViewCell.swift
//  Navigation
//
//  Created by Marat Guseynov on 08.03.2023.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    lazy var indexPathCell = IndexPath()
    
    var postModel = PostModel.makeMockModel()
    var posts = PostModel.makeMockModel()
    
    private var autorLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var myImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .white
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .systemGray
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var likeCountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(likeButtonTapped)))
        return button
    }()
    
    var viewsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var viewsImage: UIButton = {
        let image = UIButton()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.setImage(UIImage(systemName: "eye"), for: .normal)
        return image
    }()
    
    private lazy var viewsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(viewsButtonTapped)))
        button.isUserInteractionEnabled = true
        button.clipsToBounds = true
        button.backgroundColor = .red
        button.alpha = 0.2
        return button
    }()
    
    @objc func viewsButtonTapped() {
        viewsImage.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        postModel[indexPathCell.row].views += 1
        viewsLabel.text = "\(postModel[indexPathCell.row].views) Views"
        
    }
    
    @objc func likeButtonTapped() {
        likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        likeButton.tintColor = .red
        viewsImage.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        postModel[indexPathCell.row].likes += 1
        postModel[indexPathCell.row].views += 1
        likeCountLabel.text = "\(postModel[indexPathCell.row].likes) likes"
        viewsLabel.text = "\(postModel[indexPathCell.row].views) Views"
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        addviewLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setupCell(indexPath: IndexPath) {
        indexPathCell = indexPath
        autorLabel.text = postModel[indexPathCell.row].autor
        myImageView.image = postModel[indexPathCell.row].image
        likeCountLabel.text = "\(postModel[indexPathCell.row].likes) Likes"
        viewsLabel.text = "\(postModel[indexPathCell.row].views) Views"
        descriptionLabel.text = postModel[indexPathCell.row].description
    }
    
    let screenWidth = UIScreen.main.bounds.width
    
    private func addviewLayout() {
        
        contentView.addSubview(autorLabel)
        contentView.addSubview(myImageView)
        //  contentView.addSubview(viewsButton)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(likeCountLabel)
        contentView.addSubview(viewsLabel)
        contentView.addSubview(viewsImage)
        contentView.addSubview(likeButton)
        
        NSLayoutConstraint.activate([
            
            autorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            autorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            autorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            myImageView.topAnchor.constraint(equalTo: autorLabel.bottomAnchor, constant: 16),
            myImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            myImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            myImageView.heightAnchor.constraint(equalToConstant: screenWidth),
            
            //            viewsButton.topAnchor.constraint(equalTo: autorLabel.bottomAnchor, constant: 16),
            //            viewsButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            //            viewsButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            //            viewsButton.heightAnchor.constraint(equalToConstant: screenWidth),
            
            descriptionLabel.topAnchor.constraint(equalTo: myImageView.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            likeCountLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            likeCountLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            likeCountLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            likeButton.widthAnchor.constraint(equalToConstant: 22),
            likeButton.heightAnchor.constraint(equalToConstant: 22),
            likeButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            likeButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            likeButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            viewsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            viewsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            viewsImage.trailingAnchor.constraint(equalTo: viewsLabel.leadingAnchor, constant: -8),
            viewsImage.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            
        ])
    }
}

