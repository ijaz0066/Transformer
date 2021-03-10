//
//  TransformerRequest.swift
//  Transformer
//
//  Created by ijaz ahmad on 2021-03-08.
//

import Foundation
import Alamofire

struct TransformerRequest {
    
   // let authHeader = HTTPHeader(name: "Authorization", value: "Bearer"+" "+TransformerTokenService.shared.token)
    let authHeader = HTTPHeader(name: "Authorization", value: "Bearer" + " " +  UserDefaults.standard.string(forKey: "token")!)
    
    let contentTypeHeader = HTTPHeader(name: "Content-Type", value: "application/x-www-form-urlencoded")
    
    init() {
        
    }
    
    func postRequest(transformer: Transformer) -> DataRequest {
        
        let parameters: [String: String] = [
            "name": transformer.name,
            "strength": transformer.strength,
            "intelligence": transformer.intelligence,
            "speed": transformer.speed,
            "endurance": transformer.endurance,
            "rank": transformer.rank,
            "courage": transformer.courage,
            "firepower": transformer.firePower,
            "skill": transformer.skill,
            "team": transformer.team
        ]
        
        return AF.request(TransformerApiUrl.transformers(), method: .post, parameters: parameters, encoding: URLEncoding.httpBody, headers: [authHeader, contentTypeHeader] )
        
    }
    
    func getRequest() -> DataRequest {
        
        
        return AF.request(TransformerApiUrl.transformers(), method: .get, encoding: URLEncoding.httpBody, headers: [authHeader, contentTypeHeader] )
    }
    
    func putRequest(transformer: Transformer) -> DataRequest {
        let parameters: [String: String] = [
            "id": transformer.id,
            "name": transformer.name,
            "strength": transformer.strength,
            "intelligence": transformer.intelligence,
            "speed": transformer.speed,
            "endurance": transformer.endurance,
            "rank": transformer.rank,
            "courage": transformer.courage,
            "firepower": transformer.firePower,
            "skill": transformer.skill,
            "team": transformer.team
        ]
        
        return AF.request(TransformerApiUrl.transformers(), method: .put, parameters: parameters, encoding: URLEncoding.httpBody, headers: [authHeader, contentTypeHeader] )
    }
    
    func deleteRequest(transformer: Transformer) -> DataRequest {
        
        let url = TransformerApiUrl.transformers()
        let delUrl = url.appendingPathComponent(transformer.id)
        
        return AF.request(delUrl, method: .delete, encoding: URLEncoding.httpBody, headers: [authHeader, contentTypeHeader] )
    }
}
