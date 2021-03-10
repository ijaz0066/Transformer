//
//  AddTransformerPresenter.swift
//  Transformer
//
//  Created by ijaz ahmad on 2021-03-09.
//

import Foundation

protocol AddTransformerViewDelegate: class {
    func addTransformers(isAdded: Bool, message: String?)
}

class AddTransformerPresenter {
    
    weak private var addTransformerViewDelegate: AddTransformerViewDelegate?
    
    func setViewDelegate(addTransformerViewDelegate: AddTransformerViewDelegate?) {
        self.addTransformerViewDelegate = addTransformerViewDelegate
    }
    
    func addTransformer(transformer: Transformer) {
        TransformerService.shared.addTransformer(transformer: transformer) { [self] (transformer, message) in
            addTransformerViewDelegate?.addTransformers(isAdded: transformer != nil, message: message)
        }
    }
}
