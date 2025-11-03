# zmk-keyboards-cheakee

Cheakee のシールドを定義する ZMK のモジュール。

## 開発

### 前提

- Docker がインストールされていること（Docker Desktop でも可）。
- `make` が使用できること。

### コマンド

- 例: 左シールドをビルド

  ```sh
  make left
  ```

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

## Make ターゲット一覧

### 命名規則

- 接頭辞 `lc-`: 左基板がセントラルになる構成。
- 本体 `left` / `right`: 生成対象の基板の左右。
- 接尾辞 `L` / `R` / `LR`: トラックボール搭載位置（左 / 右 / 左右）。
- 接尾辞 `-nb`: トラックボールなし。

| エイリアス  | シールド名                         | 説明                                                       |
| ----------- | ---------------------------------- | ---------------------------------------------------------- |
| left        | cheakee_left                       | 左基板用                                                   |
| left-nb     | cheakee_left_no_ball               | 左基板用（ボールなし）                                     |
| rightL      | cheakee_right_ball_L               | 右基板用（トラックボール: 左）                             |
| rightR      | cheakee_right_ball_R               | 右基板用（トラックボール: 右）                             |
| rightLR     | cheakee_right_ball_LR              | 右基板用（トラックボール: 左右）                           |
| right-nb    | cheakee_right_no_ball              | 右基板用（ボールなし）                                     |
| lc-right    | cheakee_left-central_right         | 左をセントラルとする構成の右基板用                         |
| lc-right-nb | cheakee_left-central_right_no_ball | 左をセントラルとする構成の右基板用（ボールなし）           |
| lc-leftL    | cheakee_left-central_left_ball_L   | 左をセントラルとする構成の左基板用（トラックボール: 左）   |
| lc-leftR    | cheakee_left-central_left_ball_R   | 左をセントラルとする構成の左基板用（トラックボール: 右）   |
| lc-leftLR   | cheakee_left-central_left_ball_LR  | 左をセントラルとする構成の左基板用（トラックボール: 左右） |
| lc-left-nb  | cheakee_left-central_left_no_ball  | 左をセントラルとする構成の左基板用（ボールなし）           |

ビルド成果物は `build/<shield>.uf2` に生成されます。

### 関連モジュールの開発

zmk-driver-pmw3610 などは submodule で取り込まれているが通常のビルドでは使用されておらず、通常は`confit/west.yml` に記載されているモジュールが pull されて使用される。

これらのモジュールの開発のため、リモートのモジュールではなく submodule で取り込んでいるディレクトリのモジュールを使用する場合は、west.yml の該当モジュールをコメントアウトし、`entrypoint.sh` の `ZMK_EXTRA_MODULES` の `/keyboard` の後にセミコロン区切りでパスを追記する。

```sh
west build -s "zmk/app" -d "build" -b "$BOARD" $EXTRA_FLAGS -- \
    -DSHIELD="$SHIELD" \
    -DZMK_CONFIG="/keyboard/config" \
    -DZMK_EXTRA_MODULES="/keyboard;/keyboard/zmk-pmw3610-driver" -- ここ
```
