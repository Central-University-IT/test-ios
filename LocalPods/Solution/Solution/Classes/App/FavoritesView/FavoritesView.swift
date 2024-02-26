//
//  FavoritesView.swift
//  Solution
//
//  Created by Lada Zudova on 10.02.2024.
//

import Foundation
import UIKit

public struct FavoritesViewModel {
    public let badgeCount: String
    public init(badgeCount: String) {
        self.badgeCount = badgeCount
    }
}

public protocol IFavoritesView: UIView {
    func configure(model: FavoritesViewModel)
}

final class FavoritesView: UIView, IFavoritesView {
    
    private lazy var titleView: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.text = "Избранное"
        return label
    }()
    
    private lazy var badgeLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .white
        return label
    }()
    
    private lazy var badgeView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.7058823529, green: 0.7058823529, blue: 0.7058823529, alpha: 1)
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "heart")
        return imageView
    }()
    
    // init
    
    init() {
        super.init(frame: .zero)
        backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)
        layer.cornerRadius = 16
        configureUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // public
    
    func configure(model: FavoritesViewModel) {
        badgeLabel.text = model.badgeCount
    }
    
    // private
    
    private func configureUI() {
        addSubview(titleView)
        addSubview(imageView)
        addSubview(badgeView)
        
        badgeView.addSubview(badgeLabel)
        
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 120),
            
            titleView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -16),
            
            badgeView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            badgeView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            imageView.widthAnchor.constraint(equalToConstant: 40),
            imageView.heightAnchor.constraint(equalToConstant: 39),
            imageView.leadingAnchor.constraint(equalTo: titleView.leadingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            
            badgeLabel.leadingAnchor.constraint(equalTo: badgeView.leadingAnchor, constant: 8),
            badgeLabel.trailingAnchor.constraint(equalTo: badgeView.trailingAnchor, constant: -8),
            badgeLabel.topAnchor.constraint(equalTo: badgeView.topAnchor, constant: 2),
            badgeLabel.bottomAnchor.constraint(equalTo: badgeView.bottomAnchor, constant: -2)
        ])
    }
}
