//
//  MapView.swift
//  StickyView
//
//  Created by Skander Jabouzi on 2018-02-19.
//  Copyright © 2018 Medigarage Studios LTD. All rights reserved.
//

import UIKit
import MapKit

class MapView: UIView, MKMapViewDelegate {
    
    let mapView = MKMapView()
    var routes: [MKRoute] = [MKRoute]()
    var sourcePlacemark: MKPlacemark?
    var destinationPlacemark: MKPlacemark?
    var sourceMapItem: MKMapItem?
    var destinationMapItem: MKMapItem?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        
        let mapWidth:CGFloat = self.frame.size.width
        let mapHeight:CGFloat = self.frame.size.height
        mapView.delegate = self
        mapView.frame = CGRect(x: 0, y: 0, width: mapWidth, height: mapHeight)
        
        mapView.mapType = MKMapType.standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        
        // Or, if needed, we can position map in the center of the view
        mapView.center = self.center
        
        self.addSubview(mapView)
        
        // 2.
        let sourceLocation = CLLocationCoordinate2D(latitude: 45.5885222, longitude: -73.7887278)
        let destinationLocation = CLLocationCoordinate2D(latitude: 45.6820159, longitude: -73.6992162)
        
        // 3.
        sourcePlacemark = MKPlacemark(coordinate: sourceLocation, addressDictionary: nil)
        destinationPlacemark = MKPlacemark(coordinate: destinationLocation, addressDictionary: nil)
        
        // 4.
        sourceMapItem = MKMapItem(placemark: sourcePlacemark!)
        destinationMapItem = MKMapItem(placemark: destinationPlacemark!)
        
        // 5.
        let sourceAnnotation = MKPointAnnotation()
        sourceAnnotation.title = "Times Square"
        
        if let location = sourcePlacemark?.location {
            sourceAnnotation.coordinate = location.coordinate
        }
        
        
        let destinationAnnotation = MKPointAnnotation()
        destinationAnnotation.title = "Empire State Building"
        
        if let location = destinationPlacemark?.location {
            destinationAnnotation.coordinate = location.coordinate
        }
        
        // 6.
        self.mapView.showAnnotations([sourceAnnotation,destinationAnnotation], animated: true )
        
    }
    
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.red
        renderer.lineWidth = 4.0
        
        return renderer
    }
    
    func setDirection( completion: @escaping (_ success: Bool, _ result: [MKRoute], _ error: Error?) -> Void) {
    
        // 7.
        let directionRequest = MKDirectionsRequest()
        directionRequest.source = self.sourceMapItem
        directionRequest.destination = self.destinationMapItem
        directionRequest.transportType = .automobile
        directionRequest.requestsAlternateRoutes = true
        
        // Calculate the direction
        let directions = MKDirections(request: directionRequest)
        
        // 8.
        directions.calculate {
            (response, error) -> Void in
            
            guard let response = response else {
                if let error = error {
                    print("Error: \(error)")
                    completion(false, [], error)
                }
                
                return
            }
            
            self.routes = response.routes
            debugPrint(self.routes)
            for route in self.routes {
                debugPrint(route.distance) // meter
                debugPrint(route.expectedTravelTime) // seconds
                debugPrint(route.advisoryNotices)
                debugPrint(route.name)
            }
            
            self.addRoute(routeIndex: 0)
//            let route = self.routes[0]
//            self.mapView.add((route.polyline), level: MKOverlayLevel.aboveRoads)
//
//            let rect = route.polyline.boundingMapRect
//            self.mapView.setRegion(MKCoordinateRegionForMapRect(rect), animated: true)
            completion(true, self.routes, nil)
        }
    }
    
    func addRoute(routeIndex: Int) {
        self.mapView.removeOverlays(mapView.overlays)
        self.mapView.add((self.routes[routeIndex].polyline), level: MKOverlayLevel.aboveRoads)
        let rect = self.routes[routeIndex].polyline.boundingMapRect
        self.mapView.setRegion(MKCoordinateRegionForMapRect(rect), animated: true)
    }
}
