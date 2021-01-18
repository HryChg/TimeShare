//
//  ViewController.swift
//  TimeShare
//
//  Created by Harry Chuang on 1/6/21.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    
    var rooms = (1...30).map{
        return RoomModel(title: "Room \($0)", timer: $0, timeLeft: Double($0))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rooms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.Cell.roomIdentifier, for: indexPath)
        cell.textLabel?.text = rooms[indexPath.row].title
        return cell
    }
}

// MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate{
    
}

