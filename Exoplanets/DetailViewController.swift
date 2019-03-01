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
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var retreavingDataLabel: UILabel!
    @IBOutlet weak var orbitView: OrbitView!
    
    //    var item = Rate()
    var item = Planet()
    var itemName : String = ""
    let dataPlanetService = SourceDataServicePlanetRespond()
    
    //        @IBOutlet weak var backButton: UIButton!
    //
    //        @IBAction func backButton(_ sender: Any) {
    //            self.show(MainViewController(), sender: (Any).self)
    //    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.title = itemName
        detailTableView.tableFooterView = UIView(frame: CGRect.zero)
        
        activityIndicator.hidesWhenStopped = true
        retreavingDataLabel.text = "Please wait...\nRetreaving data..."
        retreavingDataLabel.isHidden = false
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()

        
        self.dataPlanetService.load(linkParameter: itemName, complition: { (data) in
            self.item = data
            //            print("Count = \(self.data.count ?? -1)")
            self.detailTableView.reloadData()
            self.activityIndicator.stopAnimating()
            self.retreavingDataLabel.isHidden = true
            self.orbitView.contentMode = .redraw
            self.orbitView.drawOrbit(eccentricity: self.item.eccentricity?.value)
//            self.activityIndicator.stopAnimating()
//            self.retreavingDataLabel.isHidden = true
            //            print("Screen reloaded")
        })

        
        
        
        
        
        
        
        
        
        
        

        
        
        
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
        
        cell.selectionStyle = .none
        cell.backgroundColor = #colorLiteral(red: 0.0009274088661, green: 0.02324046195, blue: 0.2609408498, alpha: 1)
        if let cell = cell as? DetailInfoTransfer {
            //            print("Item = \(item)")
            cell.set(item: item)
            if let cell = cell as? DetailTableViewCell {
                tableView.rowHeight = cell.labelHeight
            }
        }
        return cell
    }
    
}
