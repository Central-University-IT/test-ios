//
//  OfferDetailsViewController.swift
//  Solution
//
//  Created by Genrikh Beraylik on 14.02.2024.
//

import UIKit
import ProdMobileCore

protocol IOfferDetailsView: AnyObject {
    func configure(viewModel: OfferDetailsViewModel)
    func configure(isFavorite: Bool)
    func displayError(_ error: String)
}

final class OfferDetailsViewController: UIViewController {
    
    private let presenter: IOfferDetailsPresenter
    private let solution: SolutionProtocol.Type
    
    // UI
    private lazy var headerView: IOfferHeaderView = {
        let view = solution.offerHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var mainTextView: UITextView = {
        let view = UITextView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont.systemFont(ofSize: 14)
        view.textContainerInset = .init(top: 12, left: 12, bottom: 0, right: 12)
        view.textContainer.lineBreakMode = .byTruncatingTail
        view.isEditable = false
        view.isSelectable = false
        return view
    }()
    private lazy var offerInfoListView: OfferInfoListView = {
        let view = OfferInfoListView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var promocodeView: IPromocodeView = {
        let view = solution.promocodeView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()
    private lazy var favoriteButton: IFavoriteLargeButton = {
        let view = solution.favoriteLargeButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // init
    
    init(
        presenter: IOfferDetailsPresenter,
        solution: SolutionProtocol.Type
    ) {
        self.presenter = presenter
        self.solution = solution
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        configureUI()
        setupConstraints()
        
        presenter.viewDidLoad()
    }
        
    // Private
    
    private func configureUI() {
        view.backgroundColor = .white
        
        view.addSubview(headerView)
        view.addSubview(mainTextView)
        view.addSubview(offerInfoListView)
        view.addSubview(promocodeView)
        view.addSubview(favoriteButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 207),
            
            mainTextView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            mainTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainTextView.heightAnchor.constraint(equalToConstant: 135),
            
            offerInfoListView.topAnchor.constraint(equalTo: mainTextView.bottomAnchor),
            offerInfoListView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            offerInfoListView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            promocodeView.topAnchor.constraint(equalTo: offerInfoListView.bottomAnchor),
            promocodeView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            promocodeView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            favoriteButton.topAnchor.constraint(equalTo: promocodeView.bottomAnchor, constant: 37),
            favoriteButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21),
            favoriteButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -21),
        ])
    }
}

// MARK: - IOfferDetailsView

extension OfferDetailsViewController: IOfferDetailsView {
    
    func configure(viewModel: OfferDetailsViewModel) {
        
        headerView.configure(value: viewModel.cashbackValue,
                             text: viewModel.offerTitle,
                             image: viewModel.offerImage,
                             color: viewModel.brandColor)
        
        mainTextView.text = viewModel.description
        
        offerInfoListView.configure(details: viewModel.infoDetails)
        
        if let promocode = viewModel.promocode, !promocode.isEmpty {
            promocodeView.configure(code: promocode)
        }
    }
    
    func configure(isFavorite: Bool) {
        favoriteButton.configure(isFavorite: isFavorite,
                                 action: presenter.didTapFavoriteButton)
    }
    
    func displayError(_ error: String) {
        let alert = UIAlertController(title: "Ошибка", message: error, preferredStyle: .alert)
        let action = UIAlertAction(title: "Хорошо", style: .default) { _ in
            self.navigationController?.popViewController(animated: true)
        }
        
        alert.addAction(action)
        present(alert, animated: true)
    }
}
