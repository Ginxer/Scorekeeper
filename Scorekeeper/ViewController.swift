//
//  ViewController.swift
//  Scorekeeper
//
//  Created by George Arias on 12/18/18.
//  Copyright © 2018 George Arias. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var scores = ["George": 4, "Elroy" : 3, "Duy" : 2, "Phuong" : 1]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return scores.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "score", for: indexPath) as! ScoreCell
        
        let row = indexPath.row
        let name = Array(scores.keys)[row]
        cell.decorate(for: name, in: self)
        
        return cell
    }
    
    

}

class ScoreCell: UITableViewCell
{
    
    
    @IBOutlet weak var label: UILabel!
    var name: String!
    var controller: ViewController!
    
    func decorate(for name: String, in controller: ViewController)
    {
        let score = controller.scores[name] ?? 0
        self.label.text = "\(name) : \(score)"
        
        self.name = name
        self.controller = controller
    }
    
    func updateScore(offset: Int)
    {
        var score = controller.scores[name] ?? 0
        score += offset
        controller.scores[name] = score
        
        self.label.text = "\(name ?? "Unnamed Person"): \(score)"
        
    }
    
    @IBAction func subtract(_ sender: AnyObject) {
        self.updateScore(offset: -1)
        
    }
    
    @IBAction func add(_ sender: AnyObject)
    {
        self.updateScore(offset: 1)
    }
}

