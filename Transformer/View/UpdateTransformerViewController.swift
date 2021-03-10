//
//  UpdateTransformerViewController.swift
//  Transformer
//
//  Created by ijaz ahmad on 2021-03-09.
//

import UIKit

class UpdateTransformerViewController: UIViewController {
    
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
    
    // MARK: - Inject
    var transformer: Transformer!
    
    var updateTransformerPresenter = UpdateTransferPresenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        setTransformerValues()
        updateTransformerPresenter.setViewDelegate(updateTransformerViewDelegate: self)

        // Do any additional setup after loading the view.
    }
    
    func setTransformerValues() {
        name.text = transformer.name
        intelligence.text = transformer.intelligence
        rank.text = transformer.rank
        firePower.text = transformer.firePower
        team.text = transformer.team
        strength.text = transformer.strength
        endurance.text = transformer.endurance
        courage.text = transformer.courage
        skill.text = transformer.skill
        speed.text = transformer.speed
    }
    
    func updateTransformerValues() {
        transformer.name = name.text
        transformer.intelligence = intelligence.text
        transformer.rank = rank.text
        transformer.firePower = firePower.text
        transformer.team = team.text
        transformer.strength = strength.text
        transformer.endurance = endurance.text
        transformer.courage = courage.text
        transformer.skill = skill.text
        transformer.speed = speed.text
    }
    
    @IBAction func Update(_ sender: UIBarButtonItem) {
        updateTransformerValues()
        updateTransformerPresenter.updateTransformer(transformer: transformer)
    }
}

extension UpdateTransformerViewController: UpdateTransformerViewDelegate {
    
    func updateTransformers(isUpdated: Bool, message: String?) {
        self.view.makeToast(message ?? "Transformer updated successfully", duration: 5.0, position: .top)
    }
    
    
}
