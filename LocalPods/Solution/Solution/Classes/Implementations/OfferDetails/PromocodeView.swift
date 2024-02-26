//
//  PromocodeView.swift
//  Solution
//
//  Created by Genrikh Beraylik on 14.02.2024.
//

import UIKit

public protocol IPromocodeView: UIView {
    func configure(code: String)
}

final class PromocodeView: UIView, IPromocodeView {
    
    // UI
    
    // --TODO--
    
    // init
    
    init() {
        super.init(frame: .zero)
        
        isHidden = true
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // public
    
    func configure(code: String) {
        isHidden = false
    }
}
