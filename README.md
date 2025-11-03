# zmk-keyboards-cheakee

このリポジトリは ZMK 用 Cheakee シールド群と設定を含むのだ。`seeeduino_xiao_ble` 向けに UF2 を生成するのだ。

## 前提

- Docker がインストールされていること（Docker Desktop でも可）なのだ。
- `make` が使えることなのだ。

## クイックスタート

```sh
# まずはビルド用 Docker イメージを作る（初回 or west.yml 更新時）
make build-image

# すべてのシールドをビルド（UF2 は build/*.uf2 に出力）
make
```

## よく使うコマンド

```sh
# 左だけをビルド（エイリアス）
make left

# 右（親指側センサー: L / R / LR などのバリエーション）
make rightL      # 右 L
make rightR      # 右 R
make rightLR     # 右 LR
make right-nb    # 右（no ball）

# 左中央系（Left-Central）
make lc-right       # 左中央 - 右
make lc-right-nb    # 左中央 - 右（no ball）
make lc-leftL       # 左中央 - 左 L
make lc-leftR       # 左中央 - 左 R
make lc-leftLR      # 左中央 - 左 LR
make lc-left-nb     # 左中央 - 左（no ball）

# デバッグビルド（USB ログを有効化）
make left-debug

# 設定リセット用 UF2（ZMK settings reset）
make reset

# 生成物を削除
make clean
```

## 正式ターゲット名（必要に応じて）

```sh
# エイリアスの代わりに正式名でもビルドできるのだ
make cheakee_left
make cheakee_left_no_ball
make cheakee_right_ball_L
make cheakee_right_ball_R
make cheakee_right_ball_LR
make cheakee_right_no_ball
make cheakee_left-central_right
make cheakee_left-central_right_no_ball
make cheakee_left-central_left_ball_L
make cheakee_left-central_left_ball_R
make cheakee_left-central_left_ball_LR
make cheakee_left-central_left_no_ball
```

## 出力と書き込み

- ビルド成果物は `build/<shield>.uf2` に生成されるのだ。
- Seeed XIAO BLE をブートローダーモードにして、マウントされたドライブへ UF2 をドラッグ & ドロップするのだ。

## 環境変数

```sh
# Docker イメージ名を変更したいとき
IMAGE=my-zmk-env make build-image

# すべてのビルドでデバッグを有効化したいとき
DEBUG=1 make rightL
```

## メモ

- `config/west.yml` を更新した場合は、`make build-image` でイメージを作り直すのだ。
- `boards/shields/cheakee` 以下に各バリエーションの overlay があるのだ。`config/cheakee.keymap` を編集して配列を調整するのだ。
