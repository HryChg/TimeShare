//
//  ViewUtils.swift
//  TimeShare
//
//  Created by Harry Chuang on 2/1/21.
//  Copyright © 2021 harrychuang. All rights reserved.
//

import Foundation
import UIKit


struct ViewUtils {
    
    // remove vc itself from navigation controller stack
    // https://stackoverflow.com/a/65165282
    static func removeSelfFromNavigation (_ vc: UIViewController) {
        if var controllers = vc.navigationController?.viewControllers {
            if let index = controllers.firstIndex(of: vc) { controllers.remove(at: index) }
            vc.navigationController?.setViewControllers(controllers, animated: true)
        } else {
            print("Could not find navigation controller for \(vc).")
        }
    }
}
