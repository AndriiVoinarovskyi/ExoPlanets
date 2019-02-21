//
//  MainViewController.swift
//  Exoplanets
//
//  Created by Macbook Pro 13 on 02.18.19.
//  Copyright © 2019 My Company. All rights reserved.
//

import UIKit

protocol IndexTransition {
    func setTitleByIndex (value : Rate)
//    func setTitleByIndex (value : Planet)

}

extension IndexTransition {
    func set (value: Rate) {
//    func set (value: Planet) {
        setTitleByIndex(value: value)
    }
}

class MainViewController: UIViewController {
    
    @IBOutlet weak var mainTableView: MainTableView!
    
//    let dataService: SourceDataService = SourceDataService()
//    var data = Exoplanets()
    
    let dataService: TestSourceDataService = TestSourceDataService()
    var data : [Rate] = []

    var count = 0
    
    override func viewDidLoad() {
        mainTableView.tableFooterView = UIView(frame: CGRect.zero)
        super.viewDidLoad()
        
        DispatchQueue.main.async {
            self.dataService.load(complition: { (data) in
                self.data = data
                self.count = data.count
                print("Count = \(self.data.count)")
                self.mainTableView.reloadData()
                print("Screen reloaded")
            })
            
            
            
        }
        
        
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

extension MainViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryTableViewCell", for: indexPath)
        if (indexPath.row % 2 == 0) {
            cell.backgroundColor = UIColor.init(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        } else {
            cell.backgroundColor = UIColor.init(red: 0.8, green: 0.8, blue: 0.8, alpha: 1.0)
        }
        if let cell = cell as? IndexTransition {
//            let value = self.data.results[indexPath.row]
            let value = self.data[indexPath.row]

            print ("Cell title \(value)")
            cell.set(value: value)
        }
        
        return cell
    }
}
