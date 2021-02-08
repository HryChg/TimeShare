//
//  TimerVC.swift
//  TimeShare
//
//  Created by Harry Chuang on 1/18/21.
//  Copyright © 2021 harrychuang. All rights reserved.
//

import UIKit
import UICircularProgressRing
import SwiftUI

class TimerVC: UIViewController {
    @IBOutlet var tableView: UITableView!
    @IBOutlet var progressRing: UICircularProgressRing!
    
    var members = Array(repeating: MemberModel(name: "Fake Name", avatarURL: "TESTURKL", goal: "JUST A GOAL"), count: 30)

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // Somewhere not in viewDidLoad (since the views have not set yet, thus cannot be animated)
        // Remember to use unowned or weak self if refrencing self to avoid retain cycle
        progressRing.startProgress(to: 49, duration: 2.0) {
            print("Done animating!")
            // Do anything your heart desires...
        }

    }
}

// MARK: - UITableViewDataSource

extension TimerVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return members.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.Cell.memberIdentifier, for: indexPath)
        cell.textLabel?.text = members[indexPath.row].name
        // TODO: Add more attributes
        return cell
    }
}
