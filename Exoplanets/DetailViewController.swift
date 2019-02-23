//
//  DetailViewController.swift
//  Exoplanets
//
//  Created by Macbook Pro 13 on 02.18.19.
//  Copyright © 2019 My Company. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, IndexTransition {

//    func setTitleByIndex(value: Rate) {
//        self.label.text = "Date: \(value.exchangedate) \(value.txt) = \(value.rate)"
//    }

        func setTitleByIndex(value: Planet) {
        self.label.text = "Name: \(value.name) mass = \(value.mass)"
    }

    
    
    @IBOutlet weak var detailTableView: UITableView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var orbitView: UIView!
    
//    var item = Rate()
    var item = Planet()
//        @IBOutlet weak var backButton: UIButton!
//
//        @IBAction func backButton(_ sender: Any) {
//            self.show(MainViewController(), sender: (Any).self)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailTableView.tableFooterView = UIView(frame: CGRect.zero)
        setTitleByIndex(value: item)
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
