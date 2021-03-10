//
//  TransformerApiUrl.swift
//  Transformer
//
//  Created by ijaz ahmad on 2021-03-08.
//

import Foundation

enum EndPoint: String {
    //add api end points here
    case token = "allspark"
    case transformers = "transformers"
}

class TransformerApiUrl {
    static private let baseUrl = "https://transformers-api.firebaseapp.com/"
}

extension TransformerApiUrl {
    
    //Functions to get api endpoints
    static func token() -> URL {
        let url = URL(string: baseUrl + EndPoint.token.rawValue)!
        return url
    }
    
    static func transformers() -> URL {
        let url = URL(string: baseUrl + EndPoint.transformers.rawValue)!
        return url
    }

}
