//
//  DetailViewController.swift
//  iRentals
//
//  Created by sahebroy on 26/06/22.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    
    let presenter: DetailPresenterRecieverProtocol
    
    private lazy var carImage: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var contentStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.distribution = .fill
        stackview.spacing = 10.0
        stackview.axis = .vertical
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    required init?(coder: NSCoder) {
        fatalError("Error ------ ")
    }
    
    init(_ presenter: DetailPresenterRecieverProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addSubviewLayers()
        self.populateData()
    }
    
    private func addSubviewLayers() {
        carImage.heightAnchor.constraint(equalToConstant: Constants.Sizes.detailImageHeight).isActive = true
        contentStackView.addArrangedSubview(carImage)
        contentStackView.addArrangedSubview(createLabelsForStackview(presenter.name))
        contentStackView.addArrangedSubview(createLabelsForStackview(presenter.model))
        contentStackView.addArrangedSubview(createLabelsForStackview(presenter.make))
        contentStackView.addArrangedSubview(createLabelsForStackview(presenter.series))
        contentStackView.addArrangedSubview(createLabelsForStackview(presenter.group))
        contentStackView.addArrangedSubview(createLabelsForStackview(presenter.fType))
        contentStackView.addArrangedSubview(createLabelsForStackview(presenter.fLevel))
        contentStackView.addArrangedSubview(createLabelsForStackview(presenter.transmission))
        contentStackView.addArrangedSubview(createLabelsForStackview(presenter.color))
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentStackView)
        
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 5.0),
            contentStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -Constants.Sizes.margin),
            contentStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: Constants.Sizes.margin),
            contentStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentStackView.widthAnchor.constraint(equalToConstant: Constants.Sizes.contentWidth),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func populateData() {
        view.backgroundColor = Constants.Colors.view
        self.title = presenter.title
        carImage.kf.setImage(with: URL.init(string: presenter.carImage), placeholder: UIImage.init(named: Constants.Strings.placeholderImage), options: [
            .transition(.fade(0.25))
        ]) { result in
            switch result {
                case .success(let value):
                    self.carImage.image = value.image
                case .failure(let error):
                    self.carImage.image = UIImage.init(named: "placeholder")
            }
        }
    }
    
    private func createLabelsForStackview(_ title: String) -> UILabel {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: Constants.FontSizes.titleFontSize)
        label.text = title
        label.numberOfLines = 1
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: Constants.Sizes.labelHeight).isActive = true
        label.textColor = Constants.Colors.text
        return label
    }
}
