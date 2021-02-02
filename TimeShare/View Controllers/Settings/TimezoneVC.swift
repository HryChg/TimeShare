//
//  TimezoneVC.swift
//  TimeShare
//
//  Created by Bo LeGrand on 1/12/21.
//  Copyright © 2021 harrychuang. All rights reserved.
//

import UIKit

class TimezoneVC: UIViewController {
    
    static let identifier = "TimezoneVC"
    
    let pickerData = [
        
        "GMT - Greenwich Mean Time (GMT)",
        "UTC - Universal Coordinated Time (GMT)",
        "ECT - European Central Time (GMT +1:00)",
        "EET - Eastern European Time (GMT +2:00)",
        "ART - (Arabic) Egypt Standard Time (GMT +2:00)",
        "EAT - Eastern African Time (GMT +3:00)",
        "MET - Middle East Time (GMT +3:30)",
        "NET - Near East Time (GMT +4:00)",
        "PLT - Pakistan Lahore Time (GMT +5:00)",
        "IST - India Standard Time (GMT +5:30)",
        "BST - Bangladesh Standard Time (GMT +6:00)",
        "VST - Vietnam Standard Time (GMT +7:00)",
        "CTT - China Taiwan Time (GMT +8:00)",
        "JST - Japan Standard Time (GMT +9:00)",
        "ACT - Australia Central Time (GMT +9:30)",
        "AET - Australia Eastern Time (GMT +10:00)",
        "SST - Solomon Standard Time (GMT +11:00)",
        "NST - New Zealand Standard Time (GMT +12:00)",
        "MIT - Midway Islands Time (GMT -11:00)",
        "HST - Hawaii Standard Time (GMT -10:00)",
        "AST - Alaska Standard Time (GMT -9:00)",
        "PST - Pacific Standard Time (GMT -8:00)",
        "PNT - Phoenix Standard Time (GMT -7:00)",
        "MST - Mountain Standard Time (GMT -7:00)",
        "CST - Central Standard Time (GMT -6:00)",
        "EST - Eastern Standard Time (GMT -5:00)",
        "IET - Indiana Eastern Standard Time (GMT -5:00)",
        "PRT - Puerto Rico and US Virgin Islands Time (GMT -4:00)",
        "CNT - Canada Newfoundland Time (GMT -3:30)",
        "AGT - Argentina Standard Time (GMT -3:00)",
        "BET - Brazil Eastern Time (GMT -3:00)",
        "CAT - Central African Time (GMT -1:00)"
        
    ]
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var chooseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupPickerView()
        
    }
    
    private func setupUI() {
        
        view.backgroundColor = UIColor(named: K.BrandColors.color2)
        
        title = "Timezone"
        
        chooseButton.backgroundColor = UIColor(hexString: "14274E")
        chooseButton.setTitleColor(.white, for: .normal)
        chooseButton.setTitle("Choose", for: .normal)
        chooseButton.layer.cornerRadius = 15
        
    }
    
    private func setupPickerView() {
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        pickerView.selectRow(21, inComponent: 0, animated: true)
        
    }
    
}

extension TimezoneVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        var pickerLabel: UILabel? = (view as? UILabel)
        if pickerLabel == nil {
            pickerLabel = UILabel()
            pickerLabel?.font = UIFont(name: "Helvetica", size: 16)
            pickerLabel?.textAlignment = .center
        }
        pickerLabel?.text = pickerData[row]
        
        return pickerLabel!
        
        
        
    }
    
    
}
