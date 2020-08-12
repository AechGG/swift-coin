//
//  ViewController.swift
//  Coin
//
//  Created by Harrison Gittos on 12/08/2020.
//  Copyright © 2020 Harrison Gittos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var currencyPicker: UIPickerView!
    var coinManager: CoinManager = CoinManager();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        coinManager.delegate = self;
        currencyPicker.delegate = self;
        currencyPicker.dataSource = self;
    }

}

// MARK: - UI Picker View Delegate

extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        coinManager.getExchangeRate(row);
    }
}

// MARK: - UI Picker View Data Source

extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row];
    }
    
}

// MARK: - Coin Manager Delegate

extension ViewController: CoinManagerDelegate {
    func didUpdateCoin(_ coinManager: CoinManager, _ coinData: CoinData) {
        DispatchQueue.main.async {
            print(coinData);
        }
    }
    
    func didFailWithError(_ error: Error) {
        print(error);
    }
    
}

