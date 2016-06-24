## 【問題２】答え合わせ

### ランキング画面の確認

* ランキング画面を確認しましょう
 * アプリで「ランキングを見る」をタップすると以下のようにランキングが表示されます

![ans2-1](/readme-img/ans2-1.png)

* 上図は１回遊んだ場合の例です。複数回遊んで、ランキングが表示されることを確認しましょう！

### コードの答え合わせ

![Xcode](/readme-img/Xcode.png)

* 模範解答は以下です

```swift
// **********【問題２】ランキングを表示しよう！**********
// GameScoreクラスを検索するクエリを作成
let query = NCMBQuery(className: "GameScore")
// scoreの降順でデータを取得するように設定する
query.addDescendingOrder("score")
// 検索件数を設定
query.limit = Int32(searchNum)
// データストアを検索
query.findObjectsInBackgroundWithBlock { (objects: [AnyObject]!, error: NSError!) -> Void in
    if error != nil {
        // 検索に失敗した場合の処理
        print("検索に失敗しました。エラーコード：\(error.code)")
    } else {
        // 検索に成功した場合の処理
        print("検索に成功しました。")
        // オブジェクトから必要なnameとscoreの値を取り出す
        var i = 0
        for object in objects {
            arrayNameData[i] = object.objectForKey("name")
            arrayScoreData[i] = object.objectForKey("score")
            i += 1
        }
    }
    // 取得した名前とスコアをAppDelegateのフィールド値に設定
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    appDelegate.nameData = arrayNameData
    appDelegate.scoreData = arrayScoreData
    // ランキング画面に遷移
    self.performSegueWithIdentifier("toLanking", sender: self)
}
// **************************************************
```
