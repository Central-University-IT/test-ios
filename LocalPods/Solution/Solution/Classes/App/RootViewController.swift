//
//  SolutionViewController.swift
//  Solution
//
//  Created by Лада Зудова on 01.02.2024.
//

import Foundation
import UIKit

public protocol ISolutionViewController: AnyObject {
    func configureAdBanner(model: AdBannerViewModel)
    func configureUserView(model: UserViewModel)
    func updateAdBannerHidden(_ isHidden: Bool)
    func configureFavoritesView(model: FavoritesViewModel)
    func reloadTable()
}
public protocol IMainRouter {
    func show(controller: UIViewController)
}

public final class RootViewController: UIViewController, ISolutionViewController {
    
    private lazy var headerViewContainer: UIStackView = {
        let view = UIStackView()
        
        view.axis = .vertical
        view.spacing = 12
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var adBannerView: AdBannerView = {
        let view = AdBannerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()
    
    private lazy var userView: UserView = {
        let view = UserView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var favoritesView: FavoritesView = {
        let view = FavoritesView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.register(SpecialOfferViewTableViewCell.self, forCellReuseIdentifier: "SpecialOfferViewTableViewCell")
        table.translatesAutoresizingMaskIntoConstraints = false
        table.rowHeight = UITableView.automaticDimension
        table.dataSource = self
        table.delegate = self
        table.separatorStyle = .none
        return table
    }()
    
    private var presenter: ISolutionPresenter

    public init(presenter: ISolutionPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter.viewDidLoad()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(tableView)

        headerViewContainer.addArrangedSubview(adBannerView)
        containerView.addSubview(userView)
        containerView.addSubview(favoritesView)
        headerViewContainer.addArrangedSubview(containerView)

        let headerViewContainerWrapper = UIView()
        headerViewContainerWrapper.translatesAutoresizingMaskIntoConstraints = false
        headerViewContainerWrapper.addSubview(headerViewContainer)
        tableView.tableHeaderView = headerViewContainerWrapper
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            headerViewContainer.leadingAnchor.constraint(equalTo: headerViewContainerWrapper.leadingAnchor, constant: 16),
            headerViewContainer.trailingAnchor.constraint(equalTo: headerViewContainerWrapper.trailingAnchor, constant: 16),
            headerViewContainer.topAnchor.constraint(equalTo: headerViewContainerWrapper.topAnchor),
            headerViewContainer.bottomAnchor.constraint(equalTo: headerViewContainerWrapper.bottomAnchor, constant: -8),
            headerViewContainer.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -32),
            
            userView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            userView.topAnchor.constraint(equalTo: containerView.topAnchor),
            userView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),

            favoritesView.leadingAnchor.constraint(equalTo: userView.trailingAnchor, constant: 16),
            favoritesView.widthAnchor.constraint(equalTo: userView.widthAnchor),
            
            favoritesView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            favoritesView.topAnchor.constraint(equalTo: containerView.topAnchor),
            favoritesView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
            ])
    }
    
    // MARK: - ISolutionViewController
    
    public func configureAdBanner(model: AdBannerViewModel) {
        adBannerView.configure(viewModel: model)
    }
    
    public func updateAdBannerHidden(_ isHidden: Bool) {
        adBannerView.isHidden = isHidden
    }

    public func configureUserView(model: UserViewModel) {
        userView.configure(viewModel: model)
    }
    
    public func configureFavoritesView(model: FavoritesViewModel) {
        favoritesView.configure(model: model)
    }

    public func reloadTable() {
        tableView.tableHeaderView?.layoutIfNeeded()
        tableView.reloadData()
    }
}

extension RootViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.specialOfferViewModels.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SpecialOfferViewTableViewCell", for: indexPath) as? SpecialOfferViewTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(viewModel: presenter.specialOfferViewModels[indexPath.row])
        cell.setNeedsLayout()
        cell.layoutIfNeeded()
        
        return cell
    }

}
extension RootViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        tableView.deselectRow(at: indexPath, animated: false)
        presenter.specialOfferViewModels[indexPath.row].onTap()
    }
}

extension RootViewController: IMainRouter {
    public func show(controller: UIViewController) {
        show(controller, sender: self)
    }
}
