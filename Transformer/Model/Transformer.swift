//
//  Transformer.swift
//  Transformer
//
//  Created by ijaz ahmad on 2021-03-07.
//

import Foundation

class Transformer: Decodable {
    
    var id: String!
    var name: String!
    var strength: String!
    var intelligence: String!
    var speed: String!
    var endurance: String!
    var rank: String!
    var courage: String!
    var firePower: String!
    var skill: String!
    var team: String!
    var teamIcon:  String!
    var rating: Int!
    
    var fightResult: Int! // 0 = did not fight,
                          // 1 = winner,
                          // 2 = eliminator,
                          // 3 = skipped,
                          // 4 = destroyed
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case strength
        case intelligence
        case speed
        case endurance
        case rank
        case courage
        case firePower = "firepower"
        case skill
        case team
        case teamIcon = "team_icon"
    }
    
    init(id: String = "0", name: String, strength: String, intelligence: String, speed: String, endurance: String, rank: String, courage: String, firePower: String, skill: String, team: String, teamIcon: String = "", fightResult: Int = 0) {
        self.id = id
        self.name = name
        self.strength = strength
        self.intelligence = intelligence
        self.speed = speed
        self.endurance = endurance
        self.rank = rank
        self.courage = courage
        self.firePower = firePower
        self.skill = skill
        self.team = team
        self.teamIcon = teamIcon
        self.fightResult = fightResult
        rating = strength.intVal() + intelligence.intVal() + speed.intVal() + endurance.intVal() + firePower.intVal()
    }
    
    required convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let id = try container.decode(String.self, forKey: .id)
        let name = try container.decode(String.self, forKey: .name)
        let strength = try container.decode(String.self, forKey: .strength)
        let intelligence = try container.decode(String.self, forKey: .intelligence)
        let speed = try container.decode(String.self, forKey: .speed)
        let endurance = try container.decode(String.self, forKey: .endurance)
        let rank = try container.decode(String.self, forKey: .rank)
        let courage = try container.decode(String.self, forKey: .courage)
        let firePower = try container.decode(String.self, forKey: .firePower)
        let skill = try container.decode(String.self, forKey: .skill)
        let team = try container.decode(String.self, forKey: .team)
        let teamIcon = try container.decode(String.self, forKey: .teamIcon)
        

        self.init(id: id, name: name, strength: strength, intelligence: intelligence, speed: speed, endurance: endurance, rank: rank, courage: courage, firePower: firePower, skill: skill, team: team, teamIcon: teamIcon)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(strength, forKey: .strength)
        try container.encodeIfPresent(intelligence, forKey: .intelligence)
        try container.encodeIfPresent(speed, forKey: .speed)
        try container.encodeIfPresent(endurance, forKey: .speed)
        try container.encodeIfPresent(rank, forKey: .rank)
        try container.encodeIfPresent(courage, forKey: .courage)
        try container.encodeIfPresent(firePower, forKey: .firePower)
        try container.encodeIfPresent(skill, forKey: .skill)
        try container.encodeIfPresent(team, forKey: .team)
        try container.encodeIfPresent(teamIcon, forKey: .teamIcon)
    }
    
}
