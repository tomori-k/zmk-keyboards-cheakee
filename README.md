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

| ターゲット  | SHIELD                             | 説明                   |
| ----------- | ---------------------------------- | ---------------------- |
| left        | cheakee_left                       | 左                     |
| left-nb     | cheakee_left_no_ball               | 左（no ball）          |
| rightL      | cheakee_right_ball_L               | 右（ball L）           |
| rightR      | cheakee_right_ball_R               | 右（ball R）           |
| rightLR     | cheakee_right_ball_LR              | 右（ball LR）          |
| right-nb    | cheakee_right_no_ball              | 右（no ball）          |
| lc-right    | cheakee_left-central_right         | 左中央 - 右            |
| lc-right-nb | cheakee_left-central_right_no_ball | 左中央 - 右（no ball） |
| lc-leftL    | cheakee_left-central_left_ball_L   | 左中央 - 左 L          |
| lc-leftR    | cheakee_left-central_left_ball_R   | 左中央 - 左 R          |
| lc-leftLR   | cheakee_left-central_left_ball_LR  | 左中央 - 左 LR         |
| lc-left-nb  | cheakee_left-central_left_no_ball  | 左中央 - 左（no ball） |

ビルド成果物は `build/<shield>.uf2` に生成されます。
