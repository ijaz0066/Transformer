//
//  TransformerService.swift
//  Transformer
//
//  Created by ijaz ahmad on 2021-03-08.
//

import Foundation
import Alamofire

struct TransformerResponse: Decodable {
    let transformers: [Transformer]
    
    enum CodingKeys: String, CodingKey {
        case transformers
    }
}

class TransformerService {
    
    static let shared = TransformerService()
    
    
    let transformerRequest = TransformerRequest()
    
    private init() {}
    
    func addTransformer(transformer: Transformer, compilitionHandler: @escaping (_ transformers: Transformer?, _ message: String?)->Void) {
        let request = transformerRequest.postRequest(transformer: transformer)
        
        request.responseDecodable(of: Transformer.self) { (response) in
            guard let tFormers = response.value else {
                compilitionHandler(nil, String(decoding: response.data!, as: UTF8.self))
                return
            }
            compilitionHandler(tFormers, nil)
        }
    }
    
    func fetchTransformers(compilitionHandler: @escaping (_ transformers: TransformerResponse)->Void) {
        
        let request = transformerRequest.getRequest()        
        request.responseDecodable(of: TransformerResponse.self) { (response) in
            guard let tFormers = response.value else { return }
              compilitionHandler(tFormers)
        }
    }
    
    func updateTransformers(transformer: Transformer, compilitionHandler: @escaping (_ transformers: Transformer?, _ message: String?)->Void) {
        
        let request = transformerRequest.putRequest(transformer: transformer)
        request.responseDecodable(of: Transformer.self) { (response) in
            guard let tFormers = response.value else {
                compilitionHandler(nil, String(decoding: response.data!, as: UTF8.self))
                return
            }
            compilitionHandler(tFormers, nil)

        }
    }
    
    func deleteTransformer(transformer: Transformer, compilitionHandler: @escaping (_ deleted: Bool, _ message: String)->Void) {
        
        let request = transformerRequest.deleteRequest(transformer: transformer)
        
        request.responseData { (response) in
            if response.data == nil { compilitionHandler(true, "Deleted ") }
            else { compilitionHandler(response.error == nil, String(decoding: response.data!, as: UTF8.self)) }
            
        }
    }
    
}

