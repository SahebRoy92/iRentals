//
//  MapViewAnnotationDetail.swift
//  iRentals
//
//  Created by sahebroy on 25/06/22.
//

import Foundation
import UIKit
import MapKit
import Kingfisher

final class AnnotationView: MKMarkerAnnotationView {

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = Constants.Colors.view
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.gray.cgColor
        imageView.layer.borderWidth = 1.0
        imageView.layer.cornerRadius = 4.0
        return imageView
    }()
    
    // MARK: Initialization
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        canShowCallout = true
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureWith(_ car: Cars) {
        imageView.frame = CGRect.init(x: 5, y: 5, width: 40.0, height: 40.0)
        self.leftCalloutAccessoryView = imageView
        imageView.kf.setImage(with: URL.init(string: car.carImageUrl), placeholder: UIImage.init(named: Constants.Strings.placeholderImage), options: [
            .transition(.fade(0.25))
        ]) { result in
            switch result {
                case .failure(let error):
                    self.imageView.image = UIImage.init(named: Constants.Strings.placeholderImage)
                default :
                    break
                }
        }
    }
}
