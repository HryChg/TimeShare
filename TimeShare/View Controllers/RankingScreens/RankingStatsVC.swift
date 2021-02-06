//
//  RankingStatsVC.swift
//  TimeShare
//
//  Created by Sean Murphy on 1/18/21.
//  Copyright © 2021 harrychuang. All rights reserved.
//

import Foundation
import UIKit
import GoogleMobileAds

class RankingStatsVC: UIViewController, UITableViewDelegate, UITableViewDataSource, GADFullScreenContentDelegate {
    
//    var interstitial = GADInterstitial
    var interstitial: GADInterstitial!
//    var hours: Array<String> = ["85", "50"]
//    var categories: Array<String> = ["Hours this week", "Hours this month"]
//    @objc property(nonatomic, strong) GADInterstitial *interstitial;
    
    
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
//        view.addSubview(createAndLoadInterstitialAd())
//        createAndLoadInterstitialAd()
                
    }
    
//    func createAndLoadInterstitialAd() -> GADInterstitial {
//        interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
//        let request = GADRequest()
//        interstitial.load(request)
//        if interstitial.isReady {
//            interstitial.present(fromRootViewController: self)
//        } else {
//            print("Ad wasn't ready")
//        }
//        return interstitial
//    }
    
//    func displayInterstitialAd() {
//        if let oAd = interstitial {
//            oAd.present(fromRootViewController: self)
//        } else {
//            print("Error loading the ad")
//        }
//    }
//
//    func adDidPresentFullScreenContent(_ ad: GADFullScreenPresentingAd) {
//        print("Ad did present full screen content")
//        interstitial = nil
//    }
//
//    func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
//        print("Ad failed to present full screen content with error \(error.localizedDescription)")
//    }
//
//    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
//        print("Ad did dismiss full screen content")
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.Cell.rankingStatsCellIdentifier, for: indexPath) as! RankingSpecificsCell
        let cells = tableView.dequeueReusableCell(withIdentifier: K.Cell.rankingStatsCellIdentifier, for: indexPath)
        cell.hoursLabel.text = /*hours[indexPath.row] ?? */"40"
        cell.statsLabel.text = /*categories[indexPath.row] ?? */"Testing TableView"
//        tableView.reloadData()
//        cells.textLabel?.text = "This is a test"
        return cells
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if interstitial.isReady {
//            interstitial.present(fromRootViewController: self)
//        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

//MARK: - GoogleAdMob

extension RankingStatsVC: GADInterstitialDelegate {
    func createAd() -> GADInterstitial {
        let ad = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
        ad.delegate = self
        ad.load(GADRequest())
        return ad
    }
    
    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        interstitial = createAd()
    }
}
