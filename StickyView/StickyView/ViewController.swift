//
//  ViewController.swift
//  StickyView
//
//  Created by Malek T. on 9/14/16.
//  Copyright © 2016 Medigarage Studios LTD. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var mapView: MapView!
    var routes: [MKRoute] = [MKRoute]()
    
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView = MapView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: self.view.frame.height - 120))
//        header.backgroundColor = .red
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedSectionHeaderHeight = 40.0
        self.automaticallyAdjustsScrollViewInsets = false
        tableView.tableHeaderView = mapView
        getRoutes()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getRoutes() {
        mapView.setDirection(completion: { success, result, error in
            if let error = error {
                print("Failed with \(error)")
            } else {
                self.routes = result
                self.tableView.reloadData()
            }
        })
    }

    //MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let v = UIView()
        v.backgroundColor = .white
        let label = UILabel(frame: CGRect(x: 10, y: 5, width: tableView.frame.width - 20, height: 30))
//        segmentedControl.insertSegment(withTitle: "One", at: 0, animated: false)
//        segmentedControl.insertSegment(withTitle: "Two", at: 1, animated: false)
//        segmentedControl.insertSegment(withTitle: "Three", at: 2, animated: false)
        label.text = "SELECT ROUTE"
        label.textAlignment = .center
        v.addSubview(label)
        return v
    }
    //MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.routes.count + 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: "CellID")
        if indexPath.row < self.routes.count {
            cell.textLabel?.text = "\(mapView.routes[indexPath.row].name) \(mapView.routes[indexPath.row].distance) \(mapView.routes[indexPath.row].expectedTravelTime)"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        self.mapView.addRoute(routeIndex: indexPath.row)
    }
}

