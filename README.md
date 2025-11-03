# zmk-keyboards-cheakee

このリポジトリは ZMK 用 Cheakee シールド群と設定を含みます。`seeeduino_xiao_ble` 向けに UF2 を生成します。

## 前提

- Docker がインストールされていること（Docker Desktop でも可）。
- `make` が使用できること。

## クイックスタート

```sh
# まずはビルド用 Docker イメージを作成（初回または config/west.yml 更新時）
make build-image

# すべてのシールドをビルド（UF2 は build/*.uf2 に出力）
make
```

## よく使うコマンド

- 例: 左シールドをビルド

```sh
make left
```

## Make ターゲット一覧

| ターゲット | SHIELD | 説明 |
|---|---|---|
| build-image | - | ビルド用 Docker イメージを作成 |
| left | cheakee_left | 左 |
| left-nb | cheakee_left_no_ball | 左（no ball） |
| rightL | cheakee_right_ball_L | 右（ball L） |
| rightR | cheakee_right_ball_R | 右（ball R） |
| rightLR | cheakee_right_ball_LR | 右（ball LR） |
| right-nb | cheakee_right_no_ball | 右（no ball） |
| lc-right | cheakee_left-central_right | 左中央 - 右 |
| lc-right-nb | cheakee_left-central_right_no_ball | 左中央 - 右（no ball） |
| lc-leftL | cheakee_left-central_left_ball_L | 左中央 - 左 L |
| lc-leftR | cheakee_left-central_left_ball_R | 左中央 - 左 R |
| lc-leftLR | cheakee_left-central_left_ball_LR | 左中央 - 左 LR |
| lc-left-nb | cheakee_left-central_left_no_ball | 左中央 - 左（no ball） |
 
## その他のターゲットの使い方（使用例つき）

- all（全ビルド）: すべてのシールドをビルドします。
  ```sh
  make
  ```

- reset（設定リセット用 UF2）: ZMK の設定をリセットする UF2 を生成します。
  ```sh
  make reset
  ```

- clean（生成物削除）: 生成した UF2 を削除します。
  ```sh
  make clean
  ```

- デバッグ版（-debug サフィックス）: 任意ターゲットのデバッグビルドを行い、USB ログを有効化します。
  ```sh
  make left-debug
  ```

<!-- 正式ターゲット名の一覧は上表を参照 -->

## 出力と書き込み

- ビルド成果物は `build/<shield>.uf2` に生成されます。
- Seeed XIAO BLE をブートローダーモードにし、マウントされたドライブへ UF2 をドラッグ & ドロップしてください。

## 環境変数

環境変数の例は以下のとおりです（1 例のみ）。

```sh
DEBUG=1 make left
```

## メモ

- `config/west.yml` を更新した場合は、`make build-image` でイメージを再作成してください。
- `boards/shields/cheakee` 以下に各バリエーションの overlay があります。`config/cheakee.keymap` を編集して配列を調整してください。
