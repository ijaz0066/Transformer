//
//  TransformerTokenService.swift
//  Transformer
//
//  Created by ijaz ahmad on 2021-03-09.
//

import Foundation
import Alamofire

class TransformerTokenService {
    
    static let shared = TransformerTokenService()
    
    private init() {}
    
    let contentTypeHeader = HTTPHeader(name: "Content-Type", value: "application/x-www-form-urlencoded")
    
    func getToken(compilitionHandler: @escaping (_ token: String)->Void) {
        let request = AF.request(TransformerApiUrl.token(), method: .get, headers: [contentTypeHeader])
        DispatchQueue.main.async {
            request.responseData { (response) in
                let token = String(decoding: response.data!, as: UTF8.self)
                print(token)
                UserDefaults.standard.set(token, forKey: "token")
                compilitionHandler(token)
            }
        }
    }
}
