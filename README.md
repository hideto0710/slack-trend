slack_trend
===============

##概要
[slack_stocker](https://git.emining.jp/gitbucket/t.sakaki/slack_stocker)で生成したファイルからトレンドを表示するデスクトップアプリケーション。

+ Electronで作成
+ CoffeeScriptとJSXで記述
+ viewのコンポーネントとしてReactをを使用
+ タスク自動化ツールにgulp.jsを使用

![SlackTrend](リンクURL)

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