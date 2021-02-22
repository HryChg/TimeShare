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
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: animated)
        super.viewWillDisappear(animated)
    }
    
    @IBAction func createButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: K.Segue.createRoomToTimer, sender: self)
        ViewUtils.removeSelfFromNavigation(self)
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
