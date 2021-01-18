//
//  CreateRoomVC.swift
//  TimeShare
//
//  Created by Harry Chuang on 1/18/21.
//  Copyright © 2021 harrychuang. All rights reserved.
//

import UIKit

class CreateRoomVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func createButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: K.Segue.goToTimer, sender: self)
    }
    
}
