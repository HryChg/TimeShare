//
//  RankingViewController.swift
//  TimeShare
//
//  Created by Bo LeGrand on 1/11/21.
//  Copyright © 2021 harrychuang. All rights reserved.
//

import UIKit
import FirebaseFirestore

class RankingViewController: UITableViewController {

    let dataBase = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: K.Cell.rankingCellNibName, bundle: nil), forCellReuseIdentifier: K.Cell.rankingCellIdntifier)
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: K.Segue.goToPersonalStats, sender: indexPath)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.Cell.rankingCellIdntifier, for: indexPath)
        cell.textLabel?.text = "This is a place holder"
        cell.textLabel?.numberOfLines = 0
        cell.accessoryType = .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
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
