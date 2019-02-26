//
//  DetailViewController.swift
//  Exoplanets
//
//  Created by Macbook Pro 13 on 02.18.19.
//  Copyright © 2019 My Company. All rights reserved.
//

import UIKit

protocol DetailInfoTransfer {
    func setDetails (item: Planet)
}

extension DetailInfoTransfer {
    func set(item: Planet) {
        setDetails(item: item)
    }
}

class DetailViewController: UIViewController {

//    func setTitleByIndex(value: Rate) {
//        self.label.text = "Date: \(value.exchangedate) \(value.txt) = \(value.rate)"
//    }

//        func setTitleByIndex(value: Planet) {
//            self.label.text = "Name: \(value.name ?? "") mass = \(value.mass?.value ?? -1.0)"
//    }

    
    
    @IBOutlet weak var detailTableView: UITableView!
    @IBOutlet weak var orbitView: OrbitView!
    
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
        orbitView.drawOrbit(eccentricity: item.eccentricity?.value ?? 0)
        
        
        
//        setTitleByIndex(value: item)
        

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

extension DetailViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailTableViewCell", for: indexPath)
        tableView.rowHeight = 700
        cell.selectionStyle = .none
        if let cell = cell as? DetailInfoTransfer {
            print("Item = \(item)")
            cell.set(item: item)
            
        }
        return cell
    }

}
