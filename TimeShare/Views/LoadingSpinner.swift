//
//  LoadingSpinner.swift
//  TimeShare
//
//  Created by Bo LeGrand on 2/9/21.
//  Copyright © 2021 harrychuang. All rights reserved.
//

import UIKit

var vSpinner : UIView?

extension UIViewController {
    
    
    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.75)
        let indicator = UIActivityIndicatorView.init(style: .large)
        indicator.color = UIColor(named: K.BrandColors.color6)
        indicator.startAnimating()
        indicator.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(indicator)
            onView.addSubview(spinnerView)
        }
        
        vSpinner = spinnerView
    }
    
    func stopSpinner() {
        DispatchQueue.main.async {
            vSpinner?.removeFromSuperview()
            vSpinner = nil
        }
    }
}
