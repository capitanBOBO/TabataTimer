//
//  SettingsScreenViewController.swift
//  TabataTimer
//
//  Created by Иван Савин on 05.05.2020.
//  Copyright © 2020 Иван Савин. All rights reserved.
//

import UIKit

class SettingsScreenViewController : UIViewController {
    
    lazy var thisView = SettingsScreenView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(thisView)
        thisView.fillInSuperview()
    }
    
}
