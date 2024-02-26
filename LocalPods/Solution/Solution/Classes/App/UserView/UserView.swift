//
//  UserView.swift
//  Solution
//
//  Created by Lada Zudova on 10.02.2024.
//

import Foundation
import UIKit

public struct UserViewModel {
    public let name: String
    public let bonusValue: String
    public let moneyValue: String

    public init(name: String, bonusValue: String, moneyValue: String) {
        self.name = name
        self.bonusValue = bonusValue
        self.moneyValue = moneyValue
    }
}

public protocol IUserView: UIView {
    func configure(viewModel: UserViewModel)
}

final class UserView: UIView, IUserView {
    
    private lazy var nameView: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    private lazy var bonusView: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        return label
    }()
    
    private lazy var moneyView: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "house")!
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
    
    func configure(viewModel: UserViewModel) {
        nameView.text = viewModel.name
        bonusView.text = viewModel.bonusValue
        moneyView.text = viewModel.moneyValue
    }
    
    // private
    
    private func configureUI() {
        addSubview(nameView)
        addSubview(bonusView)
        addSubview(moneyView)
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 120),
            
            nameView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            nameView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -16),
            
            bonusView.topAnchor.constraint(greaterThanOrEqualTo: nameView.bottomAnchor, constant: 20),
            bonusView.leadingAnchor.constraint(equalTo: nameView.leadingAnchor),
            
            moneyView.topAnchor.constraint(equalTo: bonusView.bottomAnchor, constant: 8),
            moneyView.leadingAnchor.constraint(equalTo: nameView.leadingAnchor),
            moneyView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            
            imageView.widthAnchor.constraint(equalToConstant: 47),
            imageView.heightAnchor.constraint(equalToConstant: 32),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -18)
        ])
    }
}
