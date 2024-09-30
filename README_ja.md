# stl

- リポジトリ: [https://github.com/arapower/stl](https://github.com/arapower/stl)
- [README.md](README.md)
- [README.md: Japanese](README_ja.md)

stl（Shell Testing Library）はシェルスクリプトのテストを簡単に書けるようにするテスティングライブラリです。
可能な限りPOSIXシェル互換の構文を使用し、幅広い環境での動作を目指します。

## インストール方法

stl用ディレクトリを作成したい場所で以下のコマンドを実行します。

```sh
curl -fsSL https://raw.githubusercontent.com/arapower/stl/main/mod/setup_stl.sh | sh
```

または

```sh
wget -O - https://raw.githubusercontent.com/arapower/stl/main/mod/setup_stl.sh | sh
```

## アンインストール方法

インストールのコマンドで作成された`stl`ディレクトリを削除するだけです。

## 基本的な使い方

1. テストコードを`code`ディレクトリに保存する
2. `start_stl.sh`スクリプトを実行する
3. 実行結果が表示される

テストコードは以下のような構造で書きます。

```sh
setup() {
  # テスト前の準備
}

teardown() {
  # テスト後のクリーンアップ
}

stl_test_case() {
  # テストケース
}
```

## テストの例

以下はシンプルなテストの例です。

### テスト対象のコード

- テストターゲット: `app/sample.sh`

```sh
#!/bin/sh
echo "$1"
```

### テストコード

- テストコード: `stl/code/sample.sh`

```sh
setup() {
  target_script="${PRJ_ROOT_DIR}/app/sample.sh"
}

teardown() {
  :
}

stl_echo_test() {
  assert_equal "\"${target_script}\" hello" "hello"
}
```

### テストの実行例

```
$ ./stl/start_stl.sh
[OK] sample.sh:10 stl_echo_test
```

## 関連ドキュメント

- [ユーザーマニュアル](doc/user_manual.md): テストケース関数の命名規則を含む基本的な使用方法
- [リファレンス: アサーション関数](doc/reference_assertion_functions.md): アサーション関数の詳細説明
- [stl (Shell Testing Library) の設計と実装](doc/design.md): stlの設計思想、構造、実装の特徴の概要
- [応用的な実践ガイド](doc/advanced_practical_guide.md): 高度な使用方法と実践的なテクニック
- [用語集](doc/glossary.md): stlで使用される主要な用語の定義
