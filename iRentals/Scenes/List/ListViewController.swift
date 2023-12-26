//
//  ListViewController.swift
//  iRentals
//
//  Created by sahebroy on 26/06/22.
//

import UIKit
import NotificationBannerSwift

class ListViewController: UIViewController {

    let presenter: ListPresenterRecieverProtocol
    let router: ListRouterProtocol
    let refresher = UIRefreshControl()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.tableFooterView = UIView.init(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorColor = .darkGray
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInset = UIEdgeInsets(top: 0.0, left: 0, bottom: 0, right: 0)
        tableView.separatorStyle = .singleLine
        return tableView
    }()
    
    required init?(coder: NSCoder) {
        fatalError("Error ------ ")
    }
    
    init(_ presenter: ListPresenterRecieverProtocol, router: ListRouterProtocol) {
        self.presenter = presenter
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addTableView()
        title = presenter.title
        presenter.fetchAllCars()
    }
    
    private func addTableView() {
        view.backgroundColor = Constants.Colors.view
        self.view.addSubview(tableView)
        
        refresher.attributedTitle = NSAttributedString(string: presenter.refreshTitle)
        refresher.addTarget(self, action: #selector(self.fetchLatestListingData), for: .valueChanged)
        tableView.refreshControl = refresher
        
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 44.0
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0)
        ])
        
    }
    
    @objc func fetchLatestListingData() {
        tableView.refreshControl?.beginRefreshing()
        presenter.fetchAllCars()
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        presenter.numberOfSection()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let model = presenter.didSelectAtIndex(indexPath.row) {
            let controller = router.pushToDetail(model)
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.reuse) as? ListTableViewCell else {
            let cell =  ListTableViewCell.init(style: .default, reuseIdentifier: ListTableViewCell.reuse)
            presenter.configureCellWithCar(cell, index: indexPath.row)
            return cell
        }
        presenter.configureCellWithCar(cell, index: indexPath.row)
        return cell
    }
}

extension ListViewController: ListPresenterSenderProtocol {

    func didFinishFetchingData() {
        DispatchQueue.main.async {
            self.tableView.refreshControl?.endRefreshing()
            self.tableView.reloadData()
        }
    }
    
    func didFailedToFetchData(_ error: String) {
        DispatchQueue.main.async {
            let banner = NotificationBanner(attributedTitle: NSAttributedString.init(string: error))
            banner.show()
        }
    }
}
