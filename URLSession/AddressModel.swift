//
//  AddressModel.swift
//  URLSession
//
//  Created by reina.tanaka on 2021/06/16.
//

import Foundation

struct AddressModel: Decodable {
    var results: [Result]
    
    struct Result: Decodable {
        var address1: String
        var address2: String
        var address3: String
        var kana1: String
        var kana2: String
        var kana3: String
    }
}
