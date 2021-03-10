//
//  UpdateTransferPresenter.swift
//  Transformer
//
//  Created by ijaz ahmad on 2021-03-09.
//

import Foundation

protocol UpdateTransformerViewDelegate: class {
    func updateTransformers(isUpdated: Bool, message: String?)
}

class UpdateTransferPresenter {
    
    weak private var updateTransformerViewDelegate: UpdateTransformerViewDelegate?
    
    func setViewDelegate(updateTransformerViewDelegate: UpdateTransformerViewDelegate?) {
        self.updateTransformerViewDelegate = updateTransformerViewDelegate
    }
    
    func updateTransformer(transformer: Transformer) {
        
        TransformerService.shared.updateTransformers(transformer: transformer) { [self] (transformer, message) in
            updateTransformerViewDelegate?.updateTransformers(isUpdated: transformer != nil, message: message)
            
        }
    }
    
}
