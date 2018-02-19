//
//  ViewController.swift
//  StickyView
//
//  Created by Malek T. on 9/14/16.
//  Copyright © 2016 Medigarage Studios LTD. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

//    var mapView: MapView!
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedSectionHeaderHeight = 40.0
        self.automaticallyAdjustsScrollViewInsets = false
        // Set a header for the table view
        let header = MapView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 600))
        header.backgroundColor = .red
        tableView.tableHeaderView = header
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        return 100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: "CellID")
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
}

