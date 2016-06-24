//
//  RankingViewController.swift
//  SwiftFirstApp
//
//  Created by Natsumo Ikeda on 2016/06/23.
//  Copyright © 2016年 NIFTY Corporation. All rights reserved.
//

import UIKit
import NCMB

class RankingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // rankingTableView
    @IBOutlet weak var rankingTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rankingTableView.delegate = self
        rankingTableView.dataSource = self
    }
    
    // rankingTableViewのセルの数を指定
    func tableView(table: UITableView, numberOfRowsInSection section: Int) -> Int {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        return appDelegate.rankingNumber
    }
    
    // rankingTableViewのセルの内容を設定
    func tableView(table: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = rankingTableView.dequeueReusableCellWithIdentifier("rankingTableCell", forIndexPath: indexPath)
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        // Ranking
        let ranking = rankingTableView.viewWithTag(1) as! UILabel
        ranking.text = "\(indexPath.row+1)位"
        // name
        let name = rankingTableView.viewWithTag(2) as! UILabel
        if appDelegate.nameData[indexPath.row] == nil {
            name.text = "no data"
        } else {
            name.text = "\(appDelegate.nameData[indexPath.row])さん"
        }
        // score
        let score = rankingTableView.viewWithTag(3) as! UILabel
        if appDelegate.scoreData[indexPath.row] == nil {
            score.text = "-"
        } else {
            score.text = "\(appDelegate.scoreData[indexPath.row])連打"
        }
        return cell
    }
}