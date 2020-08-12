//
//  CoinData.swift
//  Coin
//
//  Created by Harrison Gittos on 12/08/2020.
//  Copyright © 2020 Harrison Gittos. All rights reserved.
//

import Foundation

struct CoinData : Decodable {
    let time: String;
    let asset_id_base: String;
    let asset_id_quote: String;
    let rate: Float;
}
