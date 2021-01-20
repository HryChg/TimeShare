//
//  RankingGraph.swift
//  TimeShare
//
//  Created by Sean Murphy on 1/19/21.
//  Copyright © 2021 harrychuang. All rights reserved.
//

import Foundation
import Charts

enum GraphType {
    case lineGraph
    case barGraph
    case pieChart
}

class RankingGraphVC: UIViewController, ChartViewDelegate {
    
    @IBOutlet weak var pieChartButton: UIButton!
    @IBOutlet weak var barGraphButton: UIButton!
    @IBOutlet weak var lineGraphButton: UIButton!
    
    
    
    @IBAction func pieChartPressed(_ sender: UIButton) {
    }
    
    @IBAction func barGraphPressed(_ sender: UIButton) {
    }
    
    @IBAction func lineGraphPressed(_ sender: UIButton) {
    }
    
    @IBAction func previousStatPressed(_ sender: UIButton) {
    }
    
    @IBAction func nextStatPressed(_ sender: UIButton) {
    }
}
