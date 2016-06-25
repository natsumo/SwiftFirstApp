//
//  AppDelegate.swift
//  SwiftFirstApp
//
//  Created by Natsumo Ikeda on 2016/06/22.
//  Copyright © 2016年 NIFTY Corporation. All rights reserved.
//

import UIKit
import NCMB

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    // ランキング取得数
    static let rankingNum = 5
    var rankingNumber = rankingNum
    // 名前
    var nameData = Array(count: rankingNum, repeatedValue: AnyObject!())
    // スコア
    var scoreData = Array(count: rankingNum, repeatedValue: AnyObject!())
    
    //********** APIキーの設定 **********
    let applicationkey = "YOUR_NCMB_APPLICATIONKEY"
    let clientkey      = "YOUR_NCMB_CLIENTKEY"
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        //********** SDKの初期化 **********
        NCMB.setApplicationKey(applicationkey, clientKey: clientkey)
        
        return true
    }
}

