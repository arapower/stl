# stl

<!-- TOC -->

- [stlについて](#stlについて)
- [インストール方法](#インストール方法)
- [基本的な使い方](#基本的な使い方)
- [ディレクトリ構成](#ディレクトリ構成)
- [テストコードの書き方](#テストコードの書き方)
- [テスト用変数](#テスト用変数)
- [テスト用関数](#テスト用関数)
  - [assert_both_equal](#assert_both_equal)
  - [assert_both_not_equal](#assert_both_not_equal)
  - [assert_equal](#assert_equal)
  - [assert_not_equal](#assert_not_equal)
  - [assert_error_equal](#assert_error_equal)
  - [assert_error_not_equal](#assert_error_not_equal)
  - [assert_match](#assert_match)
  - [assert_not_match](#assert_not_match)
  - [assert_error_match](#assert_error_match)
  - [assert_error_not_match](#assert_error_not_match)
  - [assert_both_equal_file](#assert_both_equal_file)
  - [assert_both_not_equal_file](#assert_both_not_equal_file)
  - [assert_equal_file](#assert_equal_file)
  - [assert_not_equal_file](#assert_not_equal_file)
  - [assert_error_equal_file](#assert_error_equal_file)
  - [assert_error_not_equal_file](#assert_error_not_equal_file)

<!-- /TOC -->

## stlについて

- stl … Shell Testing Libraryの略

## インストール方法

stl用ディレクトリを作成したいディレクトリで以下のコマンドを実行する

```sh
$ curl https://raw.githubusercontent.com/arapower/stl/main/mod/setup_stl.sh | sh
```

## 基本的な使い方

1. テストコードを`code`ディレクトリに保存する
1. `start_stl.sh`スクリプトを実行する
1. 実行結果が表示される

## ディレクトリ構成

```sh
.
├── README.md 本ファイル
├── code … テストコードファイルを保存するディレクトリ
│   └── sample.sh … テストコードのサンプルファイル
├── data … テストで使用するデータを保存するディレクトリ
├── func … テスト用関数ファイルを保存するディレクトリ
│   └── func_base.sh … テスト用関数ファイル
├── mod … 各種モジュールを保存するディレクトリ
│   └── <各種モジュール>
└── start_stl.sh … テスト開始用スクリプト
```

## テストコードの書き方

- setup関数、teardown関数はテストコードファイルごとに定義が必須です

```sh
# 各テストケースのコード実行前に共通して実行する処理
# テストコードファイルごとに定義する（必須）
setup (){
	target_script="$PRJ_ROOT_DIR/app/sample.sh"
}

# 各テストケースのコード実行後に共通して実行する処理
# テストコードファイルごとに定義する（必須）
teardown (){
	:
}
```

- テストケースごとにテストケース関数を定義します
- テストケース関数は`stl_*`の接頭辞をつけてください
- `stl_`の接頭辞がない関数定義
  - テストケース関数としては実行されません
  - その関数が定義されたテストコードファイル内で呼び出すことが可能です

```sh
# テストケース1
stl_sample1 () {
	(
		assert_equal "echo abc" "abc"
	)
}

# テストコード内で利用可能
sample_function2 () {
	(
		assert_equal "$target_script" "このスクリプトはサンプルです。"
	)
}
```

## テスト用変数

テスト用変数はテストコードファイル内で使用可能です。  
以下では各テスト用変数について記載します。

- '$PRJ_ROOT_DIR'
  - 'start_stl.sh'が存在するディレクトリの親ディレクトリの絶対パス
- '$STL_ROOT_DIR'
  - 'start_stl.sh'が存在するディレクトリの絶対パス
- '$STL_FUNCTION_DIR'
  - 'func'ディレクトリの絶対パス
- '$STL_TEST_CODE_DIR'
  - 'code'ディレクトリの絶対パス
- '$STL_TEST_DATA_DIR'
  - 'data'ディレクトリの絶対パス
- '$STL_MODULE_DIR'
  - 'mod'ディレクトリの絶対パス

## テスト用関数

テスト用関数はテストコードファイル内で使用可能です。  
以下では各テスト用関数の動作を記載します。

### assert_both_equal

- 引数
  - 1 … 検証するコマンド文字列
  - 2 … 期待する結果
- 判定
  - 引数1を実行した結果（標準出力＋標準エラー出力）が引数2と完全一致したら`OK`

### assert_both_not_equal

- 引数
  - 1 … 検証するコマンド文字列
  - 2 … 期待する結果
- 判定
  - 引数1を実行した結果（標準出力＋標準エラー出力）が引数2と完全一致**しなかったら**`OK`

### assert_equal

- 引数
  - 1 … 検証するコマンド文字列
  - 2 … 期待する結果
- 判定
  - 引数1を実行した結果（標準出力）が引数2と完全一致したら`OK`

### assert_not_equal

- 引数
  - 1 … 検証するコマンド文字列
  - 2 … 期待する結果
- 判定
  - 引数1を実行した結果（標準出力）が引数2と完全一致**しなかったら**`OK`

### assert_error_equal

- 引数
  - 1 … 検証するコマンド文字列
  - 2 … 期待する結果
- 判定
  - 引数1を実行した結果（標準エラー出力）が引数2と完全一致したら`OK`

### assert_error_not_equal

- 引数
  - 1 … 検証するコマンド文字列
  - 2 … 期待する結果
- 判定
  - 引数1を実行した結果（標準エラー出力）が引数2と完全一致**しなかったら**`OK`

### assert_match

- 引数
  - 1 … 検証するコマンド文字列
  - 2 … 期待する結果（正規表現）
- 判定
  - 引数1を実行した結果（標準出力）に引数2の正規表現が含まれていたら`OK`

### assert_not_match

- 引数
  - 1 … 検証するコマンド文字列
  - 2 … 期待する結果（正規表現）
- 判定
  - 引数1を実行した結果（標準出力）に引数2の正規表現が含まれて**いなかったら**`OK`

### assert_error_match

- 引数
  - 1 … 検証するコマンド文字列
  - 2 … 期待する結果（正規表現）
- 判定
  - 引数1を実行した結果（標準エラー出力）に引数2の正規表現が含まれていたら`OK`

### assert_error_not_match

- 引数
  - 1 … 検証するコマンド文字列
  - 2 … 期待する結果（正規表現）
- 判定
  - 引数1を実行した結果（標準エラー出力）に引数2の正規表現が含まれて**いなかったら**`OK`

### assert_both_equal_file

- 引数
  - 1 … 検証するコマンド文字列
  - 2 … 期待する結果が記載されたファイルのパス
- 判定
  - 引数1を実行した結果（標準出力＋標準エラー出力）が引数2の内容と完全一致したら`OK`

### assert_both_not_equal_file

- 引数
  - 1 … 検証するコマンド文字列
  - 2 … 期待する結果が記載されたファイルのパス
- 判定
  - 引数1を実行した結果（標準出力＋標準エラー出力）が引数2の内容と完全一致**しなかったら**`OK`

### assert_equal_file

- 引数
  - 1 … 検証するコマンド文字列
  - 2 … 期待する結果が記載されたファイルのパス
- 判定
  - 引数1を実行した結果（標準出力）が引数2の内容と完全一致したら`OK`

### assert_not_equal_file

- 引数
  - 1 … 検証するコマンド文字列
  - 2 … 期待する結果が記載されたファイルのパス
- 判定
  - 引数1を実行した結果（標準出力）が引数2の内容と完全一致**しなかったら**`OK`

### assert_error_equal_file

- 引数
  - 1 … 検証するコマンド文字列
  - 2 … 期待する結果が記載されたファイルのパス
- 判定
  - 引数1を実行した結果（標準エラー出力）が引数2の内容と完全一致したら`OK`

### assert_error_not_equal_file

- 引数
  - 1 … 検証するコマンド文字列
  - 2 … 期待する結果が記載されたファイルのパス
- 判定
  - 引数1を実行した結果（標準エラー出力）が引数2の内容と完全一致**しなかったら**`OK`
