slack_trend
===============

##概要
[slack_stocker](https://git.emining.jp/gitbucket/t.sakaki/slack_stocker)で生成したファイルからトレンドを表示するデスクトップアプリケーション。

###ダウンロード
+ [Window版](https://hottolink.box.com/s/7y0ox3pvvhddkyif0mjc8efdk489zl13)
+ [Mac版](https://hottolink.box.com/s/ad2nmutcu4rlp3875nqth72u0btmnoqn)
+ [サンプルファイル](https://git.emining.jp/gitbucket/h.inamura/slack_trend/blob/master/dist/random.log?raw=true)

###使用方法

1. ファイルをドラッグ＆ドロップ、または左上のアイコンからファイルを選択することでグラフを表示
1. グラフ上の任意の点をクリックすることで指定期間の本文を表示

###プロジェクトについて

+ Electronで作成
+ CoffeeScriptとJSXで記述
+ viewのコンポーネントとしてReactをを使用
+ タスク自動化ツールにgulp.jsを使用

### デモ

![SlackTrend](https://git.emining.jp/gitbucket/h.inamura/slack_trend/blob/master/dist/Screenshot.png?raw=true)

##開発環境

```
$ npm install gulp -g
$ npm install electron-prebuilt -g
$ git clone 'https://git.emining.jp/gitbucket/git/h.inamura/slack_trend.git'
$ cd slack_trend
$ npm install
```

##開発

###gulpの実行

```
$ gulp
```

###electronの実行

```
$ electron .
```

##プロジェクト参考

+ [Electron](http://electron.atom.io/)
+ [CoffeeScript](http://coffeescript.org/)
+ [React](https://facebook.github.io/react/index.html)
+ [material ui](http://material-ui.com/)
+ [gulp.js](http://gulpjs.com/)
