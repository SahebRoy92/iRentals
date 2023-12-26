//
//  MapViewController.swift
//  iRentals
//
//  Created by sahebroy on 25/06/22.
//

import UIKit
import MapKit
import NotificationBannerSwift

class MapViewController: UIViewController {

    let presenter: MapViewPresenterRecieverProtocol
    let router: MapViewRouterProtocol
    
    required init?(coder: NSCoder) {
        fatalError("Error ------ ")
    }
    
    init(_ presenter: MapViewPresenterRecieverProtocol, router: MapViewRouterProtocol) {
        self.presenter = presenter
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    private lazy var mapView: MKMapView = {
        let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        map.isZoomEnabled = true
        map.isRotateEnabled = true
        map.showsUserLocation = true
        map.delegate = self
        return map
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Constants.Colors.view
        self.addMapToView()
        presenter.fetchAllCarsData()
        self.title = presenter.title
    }
    
    func addDefaultLocation(_ location: CLLocationCoordinate2D? = nil) {
        // This is dummy function to set user's start location in map as Munich.
        // Normally this would be retrieved by CLLocation Delegate -
        // But for not using CLLocation for this project, by default I have kept the map's default location as Munich
        
        var center = CLLocationCoordinate2DMake(48.1351, 11.5820)
        var eyeCoordinate = CLLocationCoordinate2DMake(48.1351, 11.5820)
        if let hasCoordinates = location {
            center = hasCoordinates
            eyeCoordinate = hasCoordinates
        }
        let mapCamera = MKMapCamera(lookingAtCenter: center, fromEyeCoordinate: eyeCoordinate, eyeAltitude: 300.0)
        self.mapView.camera = mapCamera
    }
    
    func addMapToView() {
        view.addSubview(mapView)
        NSLayoutConstraint.activate([
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        self.addDefaultLocation()
    }
    
    private func drawAnnotations(_ cars: [Cars]) {
        for annotations in cars {
            let annotaion = presenter.configurePin(annotations)
            mapView.addAnnotation(annotaion)
        }
        if let firstLocation = cars.first {
            let location = CLLocationCoordinate2DMake(firstLocation.latitude, firstLocation.longitude)
            addDefaultLocation(location)
        }
    }
    
}

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? CarAnnotation, let car = annotation.car else { return nil }
        var view = mapView.dequeueReusableAnnotationView(withIdentifier: Constants.Strings.annotationReuse) as? AnnotationView
        if view == nil {
            view = AnnotationView.init(annotation: annotation, reuseIdentifier: Constants.Strings.annotationReuse)
            self.presenter.fetchAnnotationDetailViewFor(car.id, annotationView: view!)
        }
        view?.displayPriority = .required
        view?.annotation = annotation
        view?.canShowCallout = true
        return view
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(calloutTapped(sender:)))
        view.addGestureRecognizer(gesture)
    }

    @objc func calloutTapped(sender: UITapGestureRecognizer) {
        guard let annotation = (sender.view as? MKAnnotationView)?.annotation as? CarAnnotation, let car = annotation.car else { return }
        let controller = router.pushToDetail(car)
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

extension MapViewController: MapViewPresenterSenderProtocol {
    func failedToFetchData(_ error: String) {
        let banner = NotificationBanner(attributedTitle: NSAttributedString.init(string: error))
        banner.show()
    }
    
    func dataFetchedSuccessfully(_ cars: [Cars]) {
        self.drawAnnotations(cars)
    }
}
