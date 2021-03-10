//
//  ViewController.swift
//  Transformer
//
//  Created by ijaz ahmad on 2021-03-07.
//

import UIKit

class TransformerListViewController: UIViewController {
    
    @IBOutlet weak var transformerTableView: UITableView!
    @IBOutlet weak var noTransformerLabel: UILabel!
    
    
    
    //MARK:- Local Verriables
    private var transformers: [Transformer] = []
    private var selectedTransformer: Transformer!
    private let transformersListPresenter = TransformerListPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        transformerTableView.register(UINib(nibName: String(describing: TransformerTableViewCell.self), bundle: nil), forCellReuseIdentifier: "cell")
        transformerTableView.tableFooterView = UIView()
        transformersListPresenter.setViewDelegate(transformerViewDelegate: self)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if (UserDefaults.standard.value(forKey: "token") == nil) {
            TransformerTokenService.shared.getToken { (token) in
                self.transformersListPresenter.fetchTransformers()
            }
        }
        else { transformersListPresenter.fetchTransformers() }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? UpdateTransformerViewController {
            destinationVC.transformer = selectedTransformer
        }
        else if let destinationVC = segue.destination as? BattleViewController {
            destinationVC.transformers = transformers
        }
    }
    
    @IBAction func addTransformer(_ sender: Any) {
    }
    
    
    @IBAction func startBattle(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToBattle", sender: self)
    }
    
}

extension TransformerListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transformers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TransformerTableViewCell
        
        let model = transformers[indexPath.row]
        cell.transformer = model
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedTransformer = transformers[indexPath.row]
        self.performSegue(withIdentifier: "goToUpdate", sender: self)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let transformer = transformers[indexPath.row]
            transformersListPresenter.deleteTransformer(transformer: transformer)
            transformers.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
        }
    }
}

extension TransformerListViewController: TransformerViewDelegate {
    func displayTransformers(transformers: [Transformer]) {
        self.transformers = transformers
         noTransformerLabel.isHidden = transformers.count > 0
        transformerTableView.reloadData()
    }
}

