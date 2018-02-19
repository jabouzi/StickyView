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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
   func setup() {
    
        let mapView = MKMapView()
        
        let leftMargin:CGFloat = 10
        let topMargin:CGFloat = 60
        let mapWidth:CGFloat = self.frame.size.width
        let mapHeight:CGFloat = self.frame.size.height
        
        mapView.frame = CGRect(x: leftMargin, y: topMargin, width: mapWidth, height: mapHeight)
        
        mapView.mapType = MKMapType.standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        
        // Or, if needed, we can position map in the center of the view
        mapView.center = self.center
        
        self.addSubview(mapView)
    }
    
}
