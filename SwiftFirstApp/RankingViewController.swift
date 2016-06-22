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
    // 順位
    let rankingData = [1, 2, 3, 4, 5]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rankingTableView.delegate = self
        rankingTableView.dataSource = self
    }
    
    // rankingTableViewのセルの数を指定
    func tableView(table: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return rankingData.count
    }
    
    // rankingTableViewのセルの内容を設定
    func tableView(table: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = rankingTableView.dequeueReusableCellWithIdentifier("rankingTableCell", forIndexPath: indexPath)
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        // Ranking
        let ranking = rankingTableView.viewWithTag(1) as! UILabel
        ranking.text = "\(rankingData[indexPath.row])位"
        // name
        let name = rankingTableView.viewWithTag(2) as! UILabel
        if appDelegate.nameData?.count < indexPath.row+1 {
            name.text = "no data"
        } else {
            name.text = "\(appDelegate.nameData![indexPath.row])さん"
        }
        // score
        let score = rankingTableView.viewWithTag(3) as! UILabel
        if appDelegate.scoreData?.count < indexPath.row+1 {
            score.text = "-"
        } else {
            score.text = "\(appDelegate.scoreData![indexPath.row])連打"
        }
        return cell
    }
}