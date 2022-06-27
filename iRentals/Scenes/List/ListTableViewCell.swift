//
//  ListTableViewCell.swift
//  iRentals
//
//  Created by sahebroy on 26/06/22.
//

import UIKit
import Kingfisher

class ListTableViewCell: UITableViewCell {

    static let reuse = "ListTableViewCell"
    
    private lazy var mainImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = Constants.Colors.view
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.gray.cgColor
        imageView.layer.borderWidth = 1.0
        imageView.layer.cornerRadius = 30.0
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var mainTitle: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: Constants.FontSizes.titleFontSize)
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 1
        titleLabel.textAlignment = .left
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.heightAnchor.constraint(equalToConstant: Constants.Sizes.labelHeight).isActive = true
        titleLabel.textColor = Constants.Colors.text
        return titleLabel
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.distribution = .fill
        stackview.spacing = 8.0
        stackview.axis = .vertical
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    private lazy var subTitle: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: Constants.FontSizes.itemTitles)
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 1
        titleLabel.textAlignment = .left
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = Constants.Colors.subTitle
        titleLabel.heightAnchor.constraint(equalToConstant: Constants.Sizes.subtitleHeight).isActive = true
        return titleLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubviewComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func arrangeStackView() {
        mainStackView.addArrangedSubview(mainTitle)
        mainStackView.addArrangedSubview(subTitle)
    }
    
    private func addSubviewComponents() {
        backgroundColor = Constants.Colors.view
        selectionStyle = .none
        
        self.arrangeStackView()
        addSubview(mainImage)
        addSubview(mainStackView)
        NSLayoutConstraint.activate([
            mainImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.Sizes.margin),
            mainImage.topAnchor.constraint(equalTo: topAnchor, constant: 8.0),
            mainImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8.0),
            mainImage.heightAnchor.constraint(equalToConstant: 60.0),
            mainImage.widthAnchor.constraint(equalToConstant: 60.0),
            mainStackView.topAnchor.constraint(equalTo: topAnchor, constant: 10.0),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10.0),
            mainStackView.leadingAnchor.constraint(equalTo: mainImage.trailingAnchor, constant: Constants.Sizes.margin),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configureWith(_ title: String, subTitle: String, mainImage: String) {
        self.mainTitle.text = title
        self.subTitle.text = subTitle
        self.mainImage.kf.indicatorType = .activity
        self.mainImage.kf.setImage(with: URL.init(string: mainImage), placeholder: UIImage.init(named: Constants.Strings.placeholderImage), options: [
            .transition(.fade(0.25))
        ]) { result in
            switch result {
                case .success(let value):
                    self.mainImage.image = value.image
                case .failure(let error):
                    self.mainImage.image = UIImage.init(named: Constants.Strings.placeholderImage)
                }
        }
    }
    
}
