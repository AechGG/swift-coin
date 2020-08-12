//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdateCoin(_ coinManager: CoinManager,_ coinData: CoinData);
    func didFailWithError(_ error: Error);
}
struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = ""
    
    var delegate: CoinManagerDelegate?;
    
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
                    self.delegate?.didFailWithError(error!);
                }
                if let safeData = data {
                    print(self.parseJSON(safeData));
                }
            };
            
            task.resume();
        }
    }
    
    func parseJSON(_ coinData: Data) -> CoinData? {
        let decoder = JSONDecoder();
        do {
            let decodedData = try decoder.decode(CoinData.self, from: coinData);
            let rate = decodedData.rate;
            print(rate);
            return decodedData;
        } catch {
            self.delegate?.didFailWithError(error);
            return nil;
        }
    }
}
