//
//  RankingStatsVC.swift
//  TimeShare
//
//  Created by Sean Murphy on 1/18/21.
//  Copyright © 2021 harrychuang. All rights reserved.
//

import Foundation
import UIKit

class RankingStatsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var currentRankLabel: UILabel!
    @IBOutlet weak var nextRankLabel: UILabel!
    @IBOutlet weak var rankPromotionInLabel: UILabel!
    @IBOutlet weak var rankLevelLabel: UILabel!
    @IBOutlet weak var averageHoursLabel: UILabel!
    @IBOutlet weak var rankingStatsTableView: UITableView!
    
    
    override func viewDidLoad() {
        rankingStatsTableView.delegate = self
        rankingStatsTableView.dataSource = self
        rankingStatsTableView.register(UINib(nibName: K.Cell.rankingSpecificsNibName, bundle: nil), forCellReuseIdentifier: K.Cell.rankingStatsCellIdentifier)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.Cell.rankingStatsCellIdentifier, for: indexPath) as! RankingSpecificsCell
        cell.hoursLabel.text = "85"
        cell.statsLabel.text = "Hours Studied this month"
        return cell
    }
    
}
