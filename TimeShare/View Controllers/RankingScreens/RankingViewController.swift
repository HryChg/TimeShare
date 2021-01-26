//
//  RankingViewController.swift
//  TimeShare
//
//  Created by Bo LeGrand on 1/11/21.
//  Copyright © 2021 harrychuang. All rights reserved.
//

import UIKit
import FirebaseFirestore

class RankingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let dataBase = Firestore.firestore()
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: K.Cell.rankingCellNibName, bundle: nil), forCellReuseIdentifier: K.Cell.rankingCellIdentifier)
        tableView.separatorStyle = .none
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: K.Segue.goToPersonalStats, sender: indexPath)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.Cell.rankingCellIdentifier, for: indexPath) as! RankingCell
//        cell.profileRankingPic.image = 
        cell.rankingStatsLabel.text = "To be set Later"
//        cell.trophyRankingPic.image = "to be set later"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func loadStats() {
//        todo: create a loading function from the firestore database
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
