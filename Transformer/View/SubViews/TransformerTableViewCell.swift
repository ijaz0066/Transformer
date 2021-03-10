//
//  TransformerTableViewCell.swift
//  Transformer
//
//  Created by ijaz ahmad on 2021-03-09.
//

import UIKit
import SDWebImage

class TransformerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var tImageView: UIImageView!
    @IBOutlet weak var rank: UILabel!
    @IBOutlet weak var skill: UILabel!
    @IBOutlet weak var speed: UILabel!
    @IBOutlet weak var team: UILabel!
    @IBOutlet weak var strength: UILabel!
    @IBOutlet weak var courage: UILabel!
    @IBOutlet weak var endurance: UILabel!
    @IBOutlet weak var firepower: UILabel!
    @IBOutlet weak var intelligence: UILabel!
    @IBOutlet weak var rating: UILabel!
    
    var transformer: Transformer! {
        didSet {
            guard let transformer = transformer else { fatalError("transformer not found") }
            name.text = transformer.name
            rank.text = transformer.rank
            skill.text = transformer.skill
            speed.text = transformer.speed
            team.text = transformer.team
            strength.text = transformer.strength
            courage.text = transformer.courage
            endurance.text = transformer.endurance
            firepower.text = transformer.firePower
            intelligence.text = transformer.intelligence
            
            let totalRating = transformer.strength.intVal() + transformer.intelligence.intVal() + transformer.speed.intVal() + transformer.endurance.intVal() + transformer.firePower.intVal()
            rating.text = String(totalRating)
            
            tImageView.sd_setImage(with: URL(string: transformer.teamIcon), placeholderImage: #imageLiteral(resourceName: "lokiicon"), options: .highPriority, completed: nil)
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
