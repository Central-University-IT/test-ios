//
//  AdBannerView.swift
//  Solution
//
//  Created by Lada Zudova on 10.02.2024.
//

import Foundation
import UIKit

public struct AdBannerViewModel {
    public let title: String
    public let subtitle: String
    public let image: UIImage
    public let backgroundColor: UIColor
    
    public init(title: String, subtitle: String, image: UIImage, backgroundColor: UIColor) {
        self.title = title
        self.subtitle = subtitle
        self.image = image
        self.backgroundColor = backgroundColor
    }
}

public protocol IAdBannerView: UIView {
    func configure(viewModel: AdBannerViewModel)
}

final class AdBannerView: UIView, IAdBannerView {
    
    // UI
    
    private lazy var titleView: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    
    private lazy var subTitleView: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // init
    
    init() {
        super.init(frame: .zero)
        backgroundColor = #colorLiteral(red: 1, green: 0.9692223668, blue: 0.8631078601, alpha: 1)
        layer.cornerRadius = 16
        configureUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // private
    
    private func configureUI() {
        addSubview(titleView)
        addSubview(subTitleView)
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 90),
            
            titleView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            titleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            titleView.trailingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: -41),

            subTitleView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 4),
            subTitleView.leadingAnchor.constraint(equalTo: titleView.leadingAnchor),
            subTitleView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            subTitleView.trailingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: -47),
            
            imageView.widthAnchor.constraint(equalToConstant: 64),
            imageView.heightAnchor.constraint(equalToConstant: 71),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])
    }
    
    // MARK: - IAdBannerView
    
    func configure(viewModel: AdBannerViewModel) {
        titleView.text = viewModel.title
        subTitleView.text = viewModel.subtitle
        imageView.image = viewModel.image
        backgroundColor = viewModel.backgroundColor
    }
}
