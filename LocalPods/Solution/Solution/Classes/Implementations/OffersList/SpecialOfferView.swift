//
//  SpecialOfferView.swift
//  Solution
//
//  Created by Lada Zudova on 11.02.2024.
//

import Foundation
import UIKit

public struct SpecialOfferViewModel {
    public let title: String
    public let discountValue: String
    public let description: String
    public let bundleName: String?
    public let bundleBaseColor: UIColor?
    public let bundleSecondaryColor: UIColor?
    public let image: UIImage
    public let backgroundColor: UIColor
    public let isFavorite: Bool
    public let onTap: () -> ()
    public let favouriteTap: () -> ()

    public init(title: String, discountValue: String, description: String, bundleName: String?, bundleBaseColor: UIColor?, bundleSecondaryColor: UIColor?, image: UIImage, backgroundColor: UIColor, isFavorite: Bool, onTap: @escaping () -> Void, favouriteTap: @escaping () -> Void) {
        self.title = title
        self.discountValue = discountValue
        self.description = description
        self.bundleName = bundleName
        self.bundleBaseColor = bundleBaseColor
        self.bundleSecondaryColor = bundleSecondaryColor
        self.image = image
        self.backgroundColor = backgroundColor
        self.isFavorite = isFavorite
        self.onTap = onTap
        self.favouriteTap = favouriteTap
    }
}

public protocol ISpecialOfferView: UIView {
    func configure(viewModel: SpecialOfferViewModel)
}

final class SpecialOfferView: UIView, ISpecialOfferView {
    
    // --TODO--
    
    private var viewModel: SpecialOfferViewModel?
    private var isFavorite: Bool = false
    
    // init
    
    init() {
        super.init(frame: .zero)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // public
    
    func configure(viewModel: SpecialOfferViewModel) {
        self.viewModel = viewModel
        
        // --TODO--
    }

    @objc private func updateLike() {
        viewModel?.favouriteTap()
    }
}

final class SpecialOfferViewTableViewCell: UITableViewCell {

    private lazy var view = SpecialOfferView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            view.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            view.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
        ])

        selectionStyle = .none
        backgroundColor = .clear
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(viewModel: SpecialOfferViewModel) {
        view.configure(viewModel: viewModel)
    }
}
