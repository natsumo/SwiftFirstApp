# 【Swift問題集】<br>『オンラインランキング機能を作ってみよう！<br>「連打ゲーム」』
_2017/05/16作成_

![RendaGame](/readme-img/RendaGame.png)

GitHub<br>
**https://github.com/natsumo/SwiftFirstApp**

<div style="page-break-before:always"></div>

## コンテンツ概要

* ニフティクラウドmobile backendの機能『データストア』を学習するための問題集です
 * ニフティクラウドmobile backendの利用登録（無料）が必要です。
* 問題用プロジェクトにはオンラインランキング機能が実装されていない状態の「連打ゲーム」です
 * 既に実装済みのニフティクラウドmobile backendを利用するための準備（SDK導入など）方法の詳細はこちらをご覧ください。
 http://mb.cloud.nifty.com/doc/current/introduction/quickstart_ios.html

## 問題について

* 問題は２問あります
* ２問クリアすると「連打ゲーム」にオンラインランキング機能を実装したアプリが完成します
* 問題を取り組む上で必要な開発環境は以下です
 * Mac OS X 10.10(Yosemite)以上
 * Xcode ver.7 以上

<div style="page-break-before:always"></div>

## 問題に取り組む前の準備
### プロジェクトのダウンロード

▼問題用プロジェクト▼<br>
Swift3.0<br>
**https://github.com/natsumo/SwiftFirstApp/archive/Swift3.0_Question.zip**<br>
Swift2.0<br>
**https://github.com/natsumo/SwiftFirstApp/archive/Swift2.0_Question.zip**

1. 上記リンクをクリックしてzipファイルをローカルに保存します
1. zipファイルを解凍して、`SwiftFirstApp.xcworkspace`をダブルクリックしてXcodeでプロジェクトを開きます
1. アプリを実行し、「連打ゲーム」で遊んでみましょう

#### 「連打ゲーム」の操作方法

1. 「Start」ボタンをタップします
2. 「3」,「2」,「1」とカウントダウンし、「スタート！」から「タイムアップ！」の10秒間「◎」の部分がタップできるようになります
3. 10秒間に何回タップできるかを競う単純なゲームです
4. 10秒経つと名前を入力するアラートが表示されますので、入力し「OK」をタップします
5. 画面に名前とスコアが表示されます

※ __注意__：問題に取り組む前の状態では「ランキングを見る」ボタンをタップしてもランキングは表示されません

<div style="page-break-before:always"></div>

### アプリの新規作成とAPIキーの設定

![mBaaS](/readme-img/mBaaS.png)

*  ニフティクラウドmobile backendにログインしアプリの新規作成を行います
 * アプリ名はわかりやすいものにしましょう。例）「renda」
* アプリが作成されるとAPIキーが２種類（アプリケーションキーとクライアントキー）発行されます
 * 次で使用します。

![Xcode](/readme-img/Xcode.png)

* `AppDelegate.swift`を編集します
* 先程ニフティクラウドmobile backendのダッシュボード上で確認したAPIキーを、それぞれ`YOUR_NCMB_APPLICATION_KEY`と`YOUR_NCMB_CLIENT_KEY`に貼り付けます

 ![問題0-1](/readme-img/0-1.png)

* このとき、ダブルクォーテーション（`"`）を消さないように注意してください！

<div style="page-break-before:always"></div>

## 【問題１】<br>名前とスコアの保存をしてみよう！
`GameViewController.swift`を開きます。下図の__`saveScore`__ メソッドを編集し、引数の__`name`__ （アラートで入力した名前）と__`score`__ （連打ゲームでタップした回数）の値を mobile backend に保存する処理をコーディングしてください

![問題1-1](/readme-img/1-1.png)<br>※ 画像はSwift2.0 ver.です

* データストアに保存先クラスを作成します
 * クラス名は「`GameScore`」としてください
* `name`を保存するフィールドを「`name`」、`score`を保存するフィールドを「`score`」として保存してください

### ヒント
* ニフティクラウドmobile backend のiOSドキュメントはObjective-Cで書かれていますので、Swiftに書き換えたものを用意しました

 http://qiita.com/natsumo/items/c00cf7a48e0f8cd8d236

<div style="page-break-before:always"></div>

### コーディング後の作業
問題１のコーディングが完了したら、下記の作業を行います

#### 【作業1-1】
それぞれ該当する箇所に以下の処理を追記して、実行時にXcode上にログを表示できるようにします

* 保存に失敗した場合の処理を行う箇所に追記
 * Swift3.0 の場合

   ![code1_Swift3.0](/readme-img/code1_Swift3.0.png)

 * Swift2.0 の場合

   ![code1_Swift2.0](/readme-img/code1_Swift2.0.png)

* 保存に成功した場合の処理を行う箇所に追記
 * Swift3.0 の場合

   ![code2_Swift3.0](/readme-img/code2_Swift3.0.png)

 * Swift2.0 の場合

   ![code2_Swift2.0](/readme-img/code2_Swift2.0.png)

<div style="page-break-before:always"></div>

#### 【作業1-2】
シュミレーターで実行、「Start」ボタンを押してゲームを遊びます

* 名前を入力し、「OK」がタップされると【問題１】で作成した`saveScore`メソッドが呼ばれ、データが保存されます
* このとき下記のいずれかのログが出力されます

 * 保存成功時：「`保存に成功しました。objectId:*********`」
 * 保存失敗時：「`エラーが発生しました。エラーコード:******`」

※エラーコードが出た場合はこちらで確認できます
http://mb.cloud.nifty.com/doc/current/rest/common/error.html#REST_APIのエラーコードについて

<div style="page-break-before:always"></div>

### 【問題１】答え合わせ
#### ニフティクラウドmobile backend上での確認
![mBaaS](/readme-img/mBaaS.png)

* 保存されたデータを確認しましょう
 * 「データストア」をクリックすると、「`GameScore`」クラスにデータが登録されていることが確認できます。

![ans1-1](/readme-img/ans1-1.png)

* 上図はスコアが35連打で名前を「あいうえお」とした場合の例です。

<div style="page-break-before:always"></div>

#### コードの答え合わせ
模範解答は以下です

![Xcode](/readme-img/Xcode.png)

* Swift3.0 の場合

 ![Answer1_Swift3.0](/readme-img/Answer1_Swift3.0.png)

* Swift2.0 の場合

 ![Answer1_Swift2.0](/readme-img/Answer1_Swift2.0.png)

<div style="page-break-before:always"></div>

## 【問題２】<br>ランキングを表示しよう！
`RankingViewController.swift`を開きます。下図の`checkRanking`メソッドを編集し、データストアの`GameScore`クラスに保存した`name`と`score`のデータを`score`の降順（スコアの高い順）で検索・取得する処理をコーディングしてください

![問題2-1](/readme-img/2-1.png)

※ 画像はSwift2.0 ver.です

* 検索データ件数は５件とします
 * ただし、この値は「`rankingNumber`」としてフィールドに設定しているため、「`5`」の代わりに「`Int32(rankingNumber)`」を使用して設定してください

### ヒント
* ニフティクラウドmobile backendのiOSドキュメントはObjective-Cで書かれていますので、Swiftに書き換えたものを用意しました

 http://qiita.com/natsumo/items/25074fa1ce209033e98e

<div style="page-break-before:always"></div>

### コーディング後の作業
問題２のコーディングが完了したら、下記の作業を行います

#### 【作業2-1】
該当する箇所に以下の処理を追記して、実行時にXcode上にログを表示できるようにします

* 保存に失敗した場合の処理を行う箇所に追記
 * Swift3.0 の場合

   ![code3_Swift3.0](/readme-img/code3_Swift3.0.png)

 * Swift2.0 の場合

   ![code3_Swift2.0](/readme-img/code3_Swift2.0.png)

* 保存に成功した場合の処理を行う箇所に追記
 * Swif3.0 の場合

   ![code4_Swift3.0](/readme-img/code4_Swift3.0.png)

 * Swift2.0 の場合

   ![code4_Swift2.0](/readme-img/code4_Swift2.0.png)

<div style="page-break-before:always"></div>

#### 【作業2-2】
シュミレーターで実行し、「ランキングを見る」ボタンをタップします
* 画面起動後、`checkRanking`メソッドが呼ばれ、【問題１】で保存されたデータが検索・取得されます
* このとき下記のいずれかのログが出力されます
 * 検索成功時：「`検索に成功しました。`」
 * 検索失敗時：「`検索に失敗しました。エラーコード：******`」

 ※エラーコードが出た場合はこちらで確認できます
 http://mb.cloud.nifty.com/doc/current/rest/common/error.html#REST_APIのエラーコードについて

* 検索の状態（成功・失敗）に関係なく、「ランキングを見る」ボタンをタップしても、まだランキングは表示されません

#### 【作業2-3】
検索に成功したら、該当する箇所に以下の処理を追記して、取得した値から必要なデータを取り出し、ランキング画面へ反映させます

* 検索に成功した場合の処理を行う箇所に追記

 ![code5](/readme-img/code5.png)

#### 【作業2-4】
シュミレーターで実行、「ランキングを見る」ボタンを押します

* 先ほどのスコアが表示されれば完成です！おめでとうございます★

<div style="page-break-before:always"></div>

### 【問題２】答え合わせ
#### ランキング画面の確認

* ランキング画面を確認しましょう
 * アプリで「ランキングを見る」をタップすると以下のようにランキングが表示されます

![ans2-1](/readme-img/ans2-1.png)

* 上図は３回遊んだ場合の例です。複数回遊んで、ランキングが表示されることを確認しましょう！

<div style="page-break-before:always"></div>

#### コードの答え合わせ

模範解答は以下です

![Xcode](/readme-img/Xcode.png)

* Swift3.0 の場合

 ![Answer2_Swift3.0](/readme-img/Answer2_Swift3.0.png)

* Swift2.0 の場合

 ![Answer2_Swift2.0](/readme-img/Answer2_Swift2.0.png)

<div style="page-break-before:always"></div>

## 参考

* 問題の解答を実装した完全なプロジェクトをご用意しています

▼完成版プロジェクト▼<br>
Swift3.0<br>
**https://github.com/natsumo/SwiftFirstApp/archive/Swift3.0_AnswerProject.zip**<br>
Swift2.0<br>
**https://github.com/natsumo/SwiftFirstApp/archive/Swift2.0_AnswerProject.zip**

* APIキーを設定してご利用ください
