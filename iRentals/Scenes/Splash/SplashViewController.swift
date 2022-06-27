//
//  SplashViewController.swift
//  iRentals
//
//  Created by sahebroy on 24/06/22.
//

import UIKit

class SplashViewController: UIViewController {

    let router: SplashRouterProtocol
    let presenter: SplashPresenterRecieverProtocol
    
    private enum Constraints {
        static let animationViewHeight: CGFloat = 400.0
    }
    
    init(_ presenter: SplashPresenterRecieverProtocol, router: SplashRouterProtocol) {
        self.router = router
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) is not supported")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView(presenter.setupAnimationView())
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presenter.startAnimation()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        presenter.disposeAnimation()
    }
    
    func configureView(_ view: UIView) {
        self.view.backgroundColor = Constants.Colors.view
        view.bounds = self.view.bounds
        view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(view)
        NSLayoutConstraint.activate([
            view.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            view.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            view.heightAnchor.constraint(equalToConstant: Constraints.animationViewHeight),
            view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        self.navigationController?.navigationBar.isHidden = true
    }
}

extension SplashViewController: SplashPresenterSenderProtocol {
    func didFinishAnimation() {
        let nextVC = router.moveToHomeController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func didStartAnimation() {
        
    }
}
