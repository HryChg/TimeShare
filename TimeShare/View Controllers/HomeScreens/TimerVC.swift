//
//  TimerVC.swift
//  TimeShare
//
//  Created by Harry Chuang on 1/18/21.
//  Copyright © 2021 harrychuang. All rights reserved.
//

import UIKit

class TimerVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var members = Array(repeating: MemberModel(name: "Fake Name", avatarURL: "TESTURKL", goal: "JUST A GOAL"), count: 30)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
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
        // TODO Add more attributes
        return cell
    }
}
