//
//  GameViewController.swift
//  SwiftFirstApp
//
//  Created by Natsumo Ikeda on 2016/06/22.
//  Copyright © 2016年 NIFTY Corporation. All rights reserved.
//

import UIKit
import NCMB

class GameViewController: UIViewController{
    // タップ回数
    var count = 0
    // タップフラグ
    var tapFlag = false
    // タイマー（秒）
    var countTimer = 0
    // label
    @IBOutlet weak var label: UILabel!
    // counter
    @IBOutlet weak var counter: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.label.text = "↓Startボタンを押してゲームスタート↓"
        tapFlag = false
    }
    
    // 「Start」ボタン押下時の処理
    @IBAction func startGame(sender: UIButton) {
        // カウンターを0にする
        count = 0
        // タイマーを13秒にする
        countTimer = 13
        timerFunc()
    }
    
    // 名前とスコアの保存処理
    func saveScore (name: String, score: Int) {
        // **********【問題１】名前とスコアを保存しよう！**********
        
        
        
        
        
        
        
        
        
        
        
        // **************************************************
    }
    
    // 「ランキングを見る」ボタン押下時の処理
    @IBAction func checkRanking(sender: UIButton) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        // 検索件数
        let searchNum = appDelegate.rankingNumber
        
        var arrayNameData = Array(count: searchNum, repeatedValue: AnyObject!())
        var arrayScoreData = Array(count: searchNum, repeatedValue: AnyObject!())
        
        // **********【問題２】ランキングを表示しよう！**********
        
        
        
        
        
        
        
        
        
        
        
        // **************************************************
        //ランキング画面に遷移
        self.performSegueWithIdentifier("toLanking", sender: self)
    }
    
    // タイマーを作成
    func timerFunc(){
        NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "timerAction:", userInfo: nil, repeats: true)
    }
    
    // タイマーの処理
    func timerAction(sender:NSTimer){
        if countTimer >= 11 {
            self.label.text = String(countTimer - 10)
        } else {
            tapFlag = true
            if countTimer == 10{
                self.label.text = "スタート！"
            } else if countTimer <= 9 && countTimer >= 1 {
                self.label.text = String(countTimer)
            } else {
                tapFlag = false
                self.label.text = "タイムアップ！"
                // タイマーストップ
                sender.invalidate()
                // 名前入力アラートの表示
                inputName(self.count)
            }
        }
            countTimer--
    }
    
    // 名前入力アラートの表示
    func inputName (sender: Int) {
        // ファイル名を決めるアラートを表示
        let alert = UIAlertController(title: "スコア登録", message: "名前を入力してください", preferredStyle: .Alert)
        // UIAlertControllerにtextFieldを追加
        alert.addTextFieldWithConfigurationHandler { (textField: UITextField!) -> Void in
        }
        // アラートのOK押下時の処理
        alert.addAction(UIAlertAction(title: "OK", style: .Default) { (action: UIAlertAction!) -> Void in
            // 名前とスコアを保存
            self.saveScore(alert.textFields![0].text!, score: sender)
            // 名前とスコアの表示
            self.label.text = "\(alert.textFields![0].text!)さんのスコアは\(sender)連打でした"
        })
        presentViewController(alert, animated: true, completion: nil)
    }
    
    // viewタップ（シングル）時の処理
    @IBAction func tapView(sender: UITapGestureRecognizer) {
        if tapFlag {
            self.count += 1
            self.counter.text = "\(count)"
        }
    }
    
}

