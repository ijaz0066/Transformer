//
//  TransformerListPresenter.swift
//  Transformer
//
//  Created by ijaz ahmad on 2021-03-09.
//

import Foundation


protocol TransformerViewDelegate: class {
    func displayTransformers(transformers: [Transformer])
}

class TransformerListPresenter {
    
    weak private var transformerViewDelegate: TransformerViewDelegate?
    
    func setViewDelegate(transformerViewDelegate: TransformerViewDelegate?) {
        self.transformerViewDelegate = transformerViewDelegate
    }
    
    func fetchTransformers() {
        TransformerService.shared.fetchTransformers { [weak self] response in
            self?.transformerViewDelegate?.displayTransformers(transformers: response.transformers)
        }
    }
    
    func deleteTransformer(transformer: Transformer) {
        TransformerService.shared.deleteTransformer(transformer: transformer) { (isDeleted, message) in
            // notify view here
        }
    }
    
}
