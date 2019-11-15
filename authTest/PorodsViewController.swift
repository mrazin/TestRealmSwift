//
//  PorodsViewController.swift
//  authTest
//
//  Created by WSR on 14/11/2019.
//  Copyright © 2019 WSR. All rights reserved.
//

import UIKit
import  RealmSwift
class PorodsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    var porods:  Results<Poroda>!
    var flagSort = true
    var flagAction = true
    let realm = try! Realm()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return realm.objects(Poroda.self).count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        if flagSort == true {
            porods = realm.objects(Poroda.self).sorted(byKeyPath: "name", ascending: true)
            
            cell.imagView.image = UIImage(named: porods[indexPath.row].image)
            cell.nameLaba.text = porods[indexPath.row].name
        }
        else {
            porods = realm.objects(Poroda.self).sorted(byKeyPath: "name", ascending: false)
            
            cell.imagView.image = UIImage(named: porods[indexPath.row].image)
            cell.nameLaba.text = porods[indexPath.row].name
        }
        
        
        // Configure the cell...
        
        return cell
    }
    
    @IBAction func sortAction(_ sender: Any) {
        if flagAction {
            flagAction = false
            flagSort = false
            tableView.reloadData()
        } else {
            flagAction = true
            flagSort = true
            tableView.reloadData()
        }
        
    }
    
    
}
