//
//  FavoriteLargeButton.swift
//  Solution
//
//  Created by Genrikh Beraylik on 14.02.2024.
//

import UIKit

public protocol IFavoriteLargeButton: UIView {
    func configure(isFavorite: Bool, action: @escaping () -> Void)
}

final class FavoriteLargeButton: UIView, IFavoriteLargeButton {
    
    // UI
    
    private var favoriteAction: (() -> Void)?
    
    // init
    
    init() {
        super.init(frame: .zero)        
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // public
    
    func configure(isFavorite: Bool, action: @escaping () -> Void) {
        
        favoriteAction = action
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleFavoriteTap)))
    }
    
    // private
    
    @objc private func handleFavoriteTap() {
        favoriteAction?()
    }
}
