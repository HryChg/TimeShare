//
//  RoomDetailVC.swift
//  TimeShare
//
//  Created by Harry Chuang on 1/23/21.
//  Copyright © 2021 harrychuang. All rights reserved.
//

import UIKit

class RoomDetailVC: UIViewController {
    
    var members = Array(repeating: MemberModel(name: "Fake Name", avatarURL: "TESTURKL", goal: "JUST A GOAL"), count: 30)
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: animated)
        super.viewWillDisappear(animated)
    }
    
    @IBAction func joinButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: K.Segue.roomDetailToTimer, sender: self)
        ViewUtils.removeSelfFromNavigation(self)
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - UITableViewDataSource
extension RoomDetailVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return members.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.Cell.roomDetailMemberCell, for: indexPath)
        cell.textLabel?.text = members[indexPath.row].name
        // TODO Add more attributes
        return cell
    }
}
