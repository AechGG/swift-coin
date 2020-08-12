//
//  ViewController.swift
//  Coin
//
//  Created by Harrison Gittos on 12/08/2020.
//  Copyright © 2020 Harrison Gittos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let coinManager: CoinManager = CoinManager();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        coinManager.getExchangeRate(0);
    }


}

