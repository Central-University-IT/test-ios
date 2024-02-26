//
//  OfferHeaderView.swift
//  Solution
//
//  Created by Genrikh Beraylik on 14.02.2024.
//

import UIKit

public protocol IOfferHeaderView: UIView {
    func configure(value: String, text: String, image: UIImage, color: UIColor)
}

final class OfferHeaderView: UIView, IOfferHeaderView {
    
    // UI
    
    // --TODO--
    
    // init
    
    init() {
        super.init(frame: .zero)
        
        configureUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // public
    
    func configure(value: String, text: String, image: UIImage, color: UIColor) {
        // --TODO--
    }
    
    // private
    
    private func configureUI() {}
}
