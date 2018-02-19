//
//  ViewController.swift
//  StickyView
//
//  Created by Malek T. on 9/14/16.
//  Copyright © 2016 Medigarage Studios LTD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var myView: MyView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.dataSource = self
//        tableView.delegate = self
//        tableView.allowsSelection = true
//        tableView.estimatedSectionHeaderHeight = 40.0
//        self.automaticallyAdjustsScrollViewInsets = false
        // Set a header for the table view
//        debugPrint(tableView.frame.height)
        myView = MyView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        myView.routesNumber = 4
        myView.setupHeader()
        myView.setup()
        self.view1.addSubview(myView)
        let topSwipe = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.handleSwipes(_:)))
        let bottomSwipe = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.handleSwipes(_:)))
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(ViewController.handlePan(_:)))
        topSwipe.direction = .up
        bottomSwipe.direction = .down
        
//        topSwipe.cancelsTouchesInView = false
//        topSwipe.delegate = self
//        bottomSwipe.delegate = self
        myView.addGestureRecognizer(topSwipe)
        myView.addGestureRecognizer(bottomSwipe)
        myView.addGestureRecognizer(panGesture)
//        let header = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: view.frame.height - 120))
//        header.backgroundColor = .red
//        tableView.tableHeaderView = header
        debugPrint("1 \(self.view.frame.height)")
        debugPrint("2 \(self.myView.frame.height)")
        debugPrint("3 \(self.myView.center.y)")
        debugPrint("3 \(self.myView.frame.minY)")
    }

    func handleSwipes(_ sender:UISwipeGestureRecognizer) {
//        debugPrint(sender.direction)
//        if (sender.direction == .up) {
//            topConstraint.constant = 0
//        }
//
//        if (sender.direction == .down) {
//            topConstraint.constant = 450
//        }
//
//        UIView.animate(withDuration: 0.3, animations: {
//            self.view1.layoutIfNeeded()
//        })
    }
    
    func handlePan(_ sender: UIPanGestureRecognizer) {
    
        let translation = sender.translation(in: self.myView)
//        debugPrint("TX: \(translation.x)")
//        debugPrint("TY: \(translation.y)")
        
//        let location = sender.location(in: self.myView)
//        debugPrint("LX: \(location.x)")
//        debugPrint("LY: \(location.y)")
//        debugPrint("TOP: \(topConstraint.constant)")
//        if (topConstraint.constant + translation.y) < self.view1.frame.height {
//            topConstraint.constant = topConstraint.constant + translation.y
//        }
        
//        sender.view!.center = CGPoint(x: sender.view!.center.x, y: sender.view!.center.y + translation.y)
//        debugPrint("CY: \(sender.view!.frame.minY)")
        debugPrint("C: \(self.myView.frame.minY)")
//        debugPrint(sender.view!.center.y - (self.myView.frame.height / 2))
//        let position = sender.view!.center.y - (self.myView.frame.height / 2)
//        debugPrint(sender.view!.frame.minY > 0 && sender.view!.frame.minY < (self.view.frame.height - 150))
//        debugPrint(sender.view!.frame.minY > 0 )
//        debugPrint(sender.view!.frame.minY < (self.view.frame.height - 150.0))
        if self.myView.frame.minY >= 0.0 && self.myView.frame.minY <= (self.view.frame.height - 150.0) {
//            if sender.view!.frame.minY < (self.view.frame.height + (self.view.frame.height / 2) - 150.0)  {
                sender.view!.center = CGPoint(x: sender.view!.center.x, y: sender.view!.center.y + translation.y)
                sender.setTranslation(CGPoint.zero, in: self.myView)
//            }
//            sender.setTranslation(CGPoint.zero, in: self.myView)
        }
        
        if self.myView.frame.minY < 0.0 {
            sender.view!.center = CGPoint(x: sender.view!.center.x, y: self.view.center.y)
            sender.setTranslation(CGPoint.zero, in: self.myView)
        } else if self.myView.frame.minY > self.view.frame.height - 150.0 {
            sender.view!.center = CGPoint(x: sender.view!.center.x, y: ((self.view.frame.height / 2) + 150.0))
            sender.setTranslation(CGPoint.zero, in: self.myView)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: UITableViewDelegate
    /*func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let v = UIView()
        v.backgroundColor = .white
//        let segmentedControl = UISegmentedControl(frame: CGRect(x: 10, y: 5, width: tableView.frame.width - 20, height: 30))
//        segmentedControl.insertSegment(withTitle: "One", at: 0, animated: false)
//        segmentedControl.insertSegment(withTitle: "Two", at: 1, animated: false)
//        segmentedControl.insertSegment(withTitle: "Three", at: 2, animated: false)
//        v.addSubview(segmentedControl)
        return v
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    //MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40;
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Menu"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: "CellID")
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        debugPrint(indexPath.row)
    }*/
}

