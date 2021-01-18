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
    
    let roomCellNibName = String(describing: RoomCell.self)
    
    var rooms = (1...30).map{
        return RoomModel(title: "Room \($0)", workTimer: $0, breakTimer: 10, timeLeft: Double($0))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: roomCellNibName, bundle: nil), forCellReuseIdentifier: K.Cell.roomIdentifier)
        tableView.rowHeight = 118 // TODO Move this to K
        tableView.separatorStyle = .none
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: K.Segue.goToCreateRoom, sender: self)
    }
}

// MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rooms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.Cell.roomIdentifier, for: indexPath) as! RoomCell
        cell.roomTitleLabel.text = rooms[indexPath.row].title
        // TODO Add more attributes
        return cell
    }
}

// MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate{
    
}

