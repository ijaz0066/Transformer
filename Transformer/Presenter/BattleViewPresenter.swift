//
//  BattleViewPresenter.swift
//  Transformer
//
//  Created by ijaz ahmad on 2021-03-10.
//

import Foundation

protocol BattleViewDelegate: class {
    func fightResultTransformers(numberOfBattles: Int, winner: String, Looser: String, isDestroyed: Bool, autoBoats: [Transformer], deceptions: [Transformer])
}

class BattleViewPresenter {
    
    private var transformers: [Transformer]!
    
    private var autoBoats: [Transformer] = []
    private var decepticons: [Transformer] = []
    private var numberOfBattles: Int = 0
    private var isGameDestroyed: Bool = false
    
    weak private var battleViewDelegate: BattleViewDelegate?
    
    func setViewDelegate(transformers: [Transformer], battleViewDelegate: BattleViewDelegate?) {
        self.transformers = transformers
        self.battleViewDelegate = battleViewDelegate
        
    }
    
    private func filterTransformersByTeam() {
        autoBoats = transformers.filter { (trans) -> Bool in
            trans.team.uppercased() == "A"
        }
        decepticons = transformers.filter({ (trans) -> Bool in
            trans.team.uppercased() == "D"
        })
    }
    
    private func sortTeamsByRank() {
        autoBoats.sort { (transformer1, transformer2) -> Bool in
            transformer1.rank.intVal() > transformer2.rank.intVal()
        }
        
        decepticons.sort { (transformer1, transformer2) -> Bool in
            transformer1.rank.intVal() > transformer2.rank.intVal()
        }
    }
    
    func startBattle() {
        filterTransformersByTeam()
        sortTeamsByRank()
        if autoBoats.count > decepticons.count { numberOfBattles = decepticons.count }
        else { numberOfBattles = autoBoats.count }
        
        for index in 0..<numberOfBattles {
            faceOffBattle(autoBoat: autoBoats[index], deception: decepticons[index])
            if isGameDestroyed { break }
        }
        calculateWinner()
    }
    
    private func calculateWinner() {
        if isGameDestroyed {
            for element in autoBoats {
                element.fightResult = 4
            }
            for element in decepticons {
                element.fightResult = 4
            }
            battleViewDelegate?.fightResultTransformers(numberOfBattles: numberOfBattles, winner: "", Looser: "", isDestroyed: true, autoBoats: autoBoats, deceptions: decepticons)
            return
        }
        var winner: String = ""
        var looser: String = ""
        var isDestroyed: Bool = false
        if autoBoats.filter({ (transformer) -> Bool in
            transformer.fightResult == 1
        }).count > decepticons.filter({ (transformer) -> Bool in
            transformer.fightResult == 1
        }).count {
            winner = "AutoBoats"
            looser = "Deceptions"
        }
        else if autoBoats.filter({ (transformer) -> Bool in
            transformer.fightResult == 1
        }).count < decepticons.filter({ (transformer) -> Bool in
            transformer.fightResult == 1
        }).count {
            winner = "Deceptions"
            looser = "AutoBoats"
        } else {
            isDestroyed = true
        }
        battleViewDelegate?.fightResultTransformers(numberOfBattles: numberOfBattles, winner: winner, Looser: looser, isDestroyed: isDestroyed, autoBoats: autoBoats, deceptions: decepticons)
        
    }
  // 0 = did not fight,
  // 1 = winner,
  // 2 = eliminator,
  // 3 = skipped,
  // 4 = destroyed
    
    private func faceOffBattle(autoBoat: Transformer, deception: Transformer) {
        
        if (autoBoat.name == "Optimus Prime" || autoBoat.name == "Predaking")
            && (deception.name == "Optimus Prime" || deception.name == "Predaking") {
            isGameDestroyed = true
            return
        }
        
        if autoBoat.name == "Optimus Prime" || autoBoat.name == "Predaking" {
            autoBoat.fightResult = 1
            deception.fightResult = 2
            return
        }
        if deception.name == "Optimus Prime" || deception.name == "Predaking" {
            deception.fightResult = 1
            autoBoat.fightResult = 2
            return
        }
        
        if autoBoat.courage.intVal() > deception.courage.intVal() + 3
            || autoBoat.strength.intVal() > deception.strength.intVal() + 2
            || autoBoat.skill.intVal() > deception.skill.intVal() + 2  {
            autoBoat.fightResult = 1
            deception.fightResult = 2
        }
        else if deception.courage.intVal() > autoBoat.courage.intVal() + 3
            || deception.strength.intVal() > autoBoat.strength.intVal() + 2
            || deception.skill.intVal() > autoBoat.skill.intVal() + 2 {
            deception.fightResult = 1
            autoBoat.fightResult = 2
        }
        else if autoBoat.rating > deception.rating {
            autoBoat.fightResult = 1
            deception.fightResult = 2
        }
        else if deception.rating > autoBoat.rating {
            autoBoat.fightResult = 1
            deception.fightResult = 2
        }
        else {
            autoBoat.fightResult = 4
            deception.fightResult = 4
        }
    }
}

