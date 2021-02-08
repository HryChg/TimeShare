//
//  AboutVC.swift
//  TimeShare
//
//  Created by Bo LeGrand on 1/12/21.
//  Copyright © 2021 harrychuang. All rights reserved.
//

import UIKit

class AboutVC: UIViewController {
    
    static let identifier = "AboutVC"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    let titleText = "TimeShare"
    
    let bodyText = """
    TimeShare is an app where friends can share a pomodoro timer to work and take breaks together.
    
    Before starting a session, each person will be asked to enter a session goal so we can hold each other accountable during work.
    """
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }
    
    private func setupUI() {
        
        view.backgroundColor = UIColor(named: K.BrandColors.color2)
        
        title = "About"
        
        titleLabel.text = titleText
        bodyLabel.text = bodyText
        
    }
    
}
