//
//  OfferInfoListView.swift
//  Solution
//
//  Created by Genrikh Beraylik on 14.02.2024.
//

import UIKit

final class OfferInfoListView: UIView {

    // UI
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        view.text = "Информация"
        return view
    }()
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.distribution = .equalSpacing
        view.axis = .vertical
        view.spacing = 10
        return view
    }()
    
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
    
    func configure(details: [(title: String, value: String)]) {
        for item in details {
            let rowView = OfferInfoListRowView()
            rowView.configure(title: item.title, value: item.value)
            stackView.addArrangedSubview(rowView)
        }
    }
    
    // private
    
    private func configureUI() {
        addSubview(titleLabel)
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
}
