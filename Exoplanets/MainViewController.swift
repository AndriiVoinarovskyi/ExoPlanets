//
//  MainViewController.swift
//  Exoplanets
//
//  Created by Macbook Pro 13 on 02.18.19.
//  Copyright © 2019 My Company. All rights reserved.
//

import UIKit

protocol IndexTransition {
    //    func setTitleByIndex (value : Rate)
    func setTitleByIndex (value : String)
    
}

extension IndexTransition {
    //    func set (value: Rate) {
    func set (value: String) {
        setTitleByIndex(value: value)
    }
}

class MainViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var mainTableView: MainTableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var retreavingDataLabel: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    
//    let dataService: SourceDataService = SourceDataService()
//    var data = Exoplanets()
    
    let dataNameService = SourceDataServiceNamesRespond()
    var namesArray : [String] = []
    var searchNames : [String] = []
    var recentRequests : [String] = []
    let recentRequestsCount = 15
    var searchMode : Bool = false
    var count = 0
    let recentRequestsKey = "recentRequestsKey"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Space Odyssey"
        recentRequests = UserDefaults.standard.stringArray(forKey: recentRequestsKey) ?? []
        print("recentRequests =\(recentRequests)")
        
        activityIndicator.hidesWhenStopped = true
        retreavingDataLabel.text = "Please wait...\nRetreaving data..."
        retreavingDataLabel.isHidden = false
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
        mainTableView.tableFooterView = UIView(frame: CGRect.zero)
        
        self.dataNameService.load(complition: { (data) in
            self.namesArray = data
            self.count = self.namesArray.count
            print("Count = \(self.count)")
            self.mainTableView.reloadData()
            self.activityIndicator.stopAnimating()
            self.retreavingDataLabel.isHidden = true
            print("Screen reloaded")
        })
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        print("View did Appear")
        print("Search Mode = \(searchMode)")
        mainTableView.reloadData()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            if let indexPath = mainTableView.indexPathForSelectedRow {
                let dvc = segue.destination as! DetailViewController
                var item = ""
                if searchMode == false {
                    item = recentRequests.reversed()[indexPath.row]
                } else {
                    item = searchNames[indexPath.row]
                }
                dvc.itemName = item
                
                if recentRequests.contains(item) {
                    recentRequests.removeAll(where: { $0 == item })
                }
                if recentRequests.count == recentRequestsCount {
                    recentRequests.removeFirst()
                }
                recentRequests.append(item)
            }
        }
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchMode = true
        print("Begin Changing")
        guard let searchText = searchBar.text else { print ("Return"); searchMode = false; return }
        print("Search text = \(searchText)")
        searchNames = namesArray.filter { $0.prefix(searchText.count) == searchText}
        mainTableView.reloadData()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print("Stop editing")
        UserDefaults.standard.set(recentRequests, forKey: recentRequestsKey)
        searchBar.text = ""
        
        searchMode = false
        mainTableView.reloadData()
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
        if searchMode == true {
            count = searchNames.count
        } else {
            count = recentRequests.count
        }
        
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryTableViewCell", for: indexPath)
        if (indexPath.row % 2 == 0) {
            cell.backgroundColor = #colorLiteral(red: 0.0009274088661, green: 0.02324046195, blue: 0.2609408498, alpha: 1)
        } else {
            cell.backgroundColor = #colorLiteral(red: 0.003229425987, green: 0.07242881507, blue: 0.4763471484, alpha: 1)
        }
        cell.selectionStyle = .none
        if let cell = cell as? IndexTransition {
            
            if searchMode == true {
                let value = self.searchNames[indexPath.row]
                //            let value = self.data[indexPath.row]
                
                print ("Cell title \(value)")
                cell.set(value: value)

            } else {
                let value = self.recentRequests.reversed()[indexPath.row]
                //            let value = self.data[indexPath.row]
                
                print ("Cell title \(value)")
                cell.set(value: value)
            }
        }
        
        return cell 
    }
    
    
}

