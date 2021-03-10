//
//  AddTransformerViewController.swift
//  Transformer
//
//  Created by ijaz ahmad on 2021-03-09.
//

import UIKit
import Toast_Swift

class AddTransformerViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var intelligence: UITextField!
    @IBOutlet weak var rank: UITextField!
    @IBOutlet weak var firePower: UITextField!
    @IBOutlet weak var team: UITextField!
    @IBOutlet weak var strength: UITextField!
    @IBOutlet weak var endurance: UITextField!
    @IBOutlet weak var courage: UITextField!
    @IBOutlet weak var skill: UITextField!
    @IBOutlet weak var speed: UITextField!
    
    var addTransformerPresenter = AddTransformerPresenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        addTransformerPresenter.setViewDelegate(addTransformerViewDelegate: self)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Done(_ sender: UIBarButtonItem) {
        let transformer = Transformer(name: name.text!, strength: strength.text!, intelligence: intelligence.text!, speed: speed.text!, endurance: endurance.text!, rank: rank.text!, courage: courage.text!, firePower: firePower.text!, skill: skill.text!, team: team.text!)
        addTransformerPresenter.addTransformer(transformer: transformer)
        
    }
}

extension AddTransformerViewController: AddTransformerViewDelegate {
    
    func addTransformers(isAdded: Bool, message: String?) {
        
        self.view.makeToast(message ?? "Transformer added successfully", duration: 5.0, position: .top)
    }
}
