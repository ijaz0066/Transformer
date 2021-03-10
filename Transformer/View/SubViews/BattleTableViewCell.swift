//
//  BattleTableViewCell.swift
//  Transformer
//
//  Created by ijaz ahmad on 2021-03-10.
//

import UIKit

class BattleTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var teamA: UILabel!
    @IBOutlet weak var teamD: UILabel!
    
    var autoBoat: Transformer! {
        didSet {
            guard let autoBoat = autoBoat else { fatalError("transformer not found") }
            teamA.text = autoBoat.name
            if autoBoat.fightResult == 1 { teamA.textColor = UIColor.black }
            else { teamA.textColor = UIColor.lightGray }
            
        }
    }
    
    var deception: Transformer! {
        didSet {
            guard let deception = deception else { fatalError("transformer not found") }
            teamD.text = deception.name
            if deception.fightResult == 1 { teamD.textColor = UIColor.black }
            else { teamD.textColor = UIColor.lightGray }
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
