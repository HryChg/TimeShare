//
//  ChatViewController.swift
//  TimeShare
//
//  Created by Bo LeGrand on 1/11/21.
//  Copyright © 2021 harrychuang. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    var messages: [Message] = [
    
        Message(sender: "Harry", body: "Hey, what's up?"),
        Message(sender: "Sean", body: "Not much, how's it going?"),
        Message(sender: "Harry", body: "Good, just going to school and coding"),
        Message(sender: "Brian", body: "You got this."),
    
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: MessageCell.identifier, bundle: nil), forCellReuseIdentifier: MessageCell.identifier)
        
        tableView.delegate = self
        tableView.dataSource = self


    }
    
    
    @IBAction func sendButtonTapped(_ sender: UIButton) {
        
        
        
    }
    

}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MessageCell.identifier) as! MessageCell
        
        cell.bodyLabel.text = messages[indexPath.row].body
        
        return cell
    }
    
    
}
