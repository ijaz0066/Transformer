//
//  BattleViewController.swift
//  Transformer
//
//  Created by ijaz ahmad on 2021-03-10.
//

import UIKit

class BattleViewController: UIViewController {
    
    @IBOutlet weak var battleTableView: UITableView!
    @IBOutlet weak var numOfBattles: UILabel!
    @IBOutlet weak var winningTeam: UILabel!
    
    var transformers: [Transformer]!
    
    var autoBoats: [Transformer] = []
    var decepticons: [Transformer] = []
    var numberOfBattles: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        battleTableView.register(UINib(nibName: String(describing: BattleTableViewCell.self), bundle: nil), forCellReuseIdentifier: "battleCell")
        battleTableView.tableFooterView = UIView()
        
        let battleViewPresenter = BattleViewPresenter()
        battleViewPresenter.setViewDelegate(transformers: transformers, battleViewDelegate: self)
        battleViewPresenter.startBattle()
    }
}

extension BattleViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfBattles
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "battleCell") as! BattleTableViewCell
        let teamA = autoBoats[indexPath.row]
        let teamD = decepticons[indexPath.row]
        cell.autoBoat = teamA
        cell.deception = teamD
        return cell
    }
}

extension BattleViewController: BattleViewDelegate {
    func fightResultTransformers(numberOfBattles: Int, winner: String, Looser: String, isDestroyed: Bool, autoBoats: [Transformer], deceptions: [Transformer]) {
        self.numberOfBattles = numberOfBattles
        self.autoBoats = autoBoats
        self.decepticons = deceptions
        numOfBattles.text = String(numberOfBattles)
        winningTeam.text = winner
        if isDestroyed {
            winningTeam.text = "There is no winner! Game is Destroyed."
        }
        if numberOfBattles == 0 { winningTeam.text = "Battle hasn't started. Please add teams first to start the battle!" }
        self.battleTableView.reloadData()
    }
}
