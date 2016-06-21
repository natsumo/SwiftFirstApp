//
//  ViewController.swift
//  SwiftFirstApp
//
//  Created by 大森太郎 on 2016/06/20.
//  Copyright © 2016年 NIFTY Corporation. All rights reserved.
//

import UIKit
import NCMB

class ViewController: UIViewController {
    // タップ回数
    var count = 0
    // タイマー（秒）
    var countTimer = 0
    
    // label
    @IBOutlet weak var label: UILabel!
    // counter
    @IBOutlet weak var counter: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.label.text = "↓Startボタンを押してゲームスタート↓"
        
    }
    
    // viewタップ（シングル）時の処理
    @IBAction func tapView(sender: UITapGestureRecognizer) {
        self.count += 1
        self.counter.text = "\(count)"
        print("\(count)")
        
    }
    
    // 「ランキングを見る」ボタン押下時の処理
    @IBAction func checkRanking(sender: UIButton) {
        
    }
    
    // 「Start」ボタン押下時の処理
    @IBAction func startGame(sender: UIButton) {
        // タイマーを13秒に再セット
        countTimer = 13
        timerFunc()
        
    }
    
    /*タイマーの作成*/
    func timerFunc(){
        _ = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "timerAction:", userInfo: nil, repeats: true)
    
    }
    
    
    //タイマーの処理
    func timerAction(sender:NSTimer){
        self.label.text = "\(String(countTimer))秒"
        
        if countTimer >= 11 {
            self.label.text = "\(String(countTimer - 10))秒"
            
        } else if countTimer == 10{
            self.label.text = "スタート！"
            
        } else if countTimer <= 9 && countTimer >= 1 {
            self.label.text = "\(String(countTimer))秒"
            
        } else {
            self.label.text = "タイムアップ！"
            
            // タイマーストップ
            sender.invalidate()
            
        }
            countTimer--
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

