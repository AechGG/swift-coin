//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = ""
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    func getExchangeRate(_ currencyElem: Int) {
        let urlString = "\(baseURL)/\(currencyArray[currencyElem])";
        performRequest(with: urlString);
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default);
            
            var request = URLRequest(url: url);
            request.setValue(apiKey, forHTTPHeaderField: "X-CoinAPI-Key");
            let task = session.dataTask(with: request) { (data, response, error) in
                if error != nil {
                    print(error);
                }
                print(data);
            };
            
            task.resume();
        }
    }
}
