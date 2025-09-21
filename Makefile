# ---- 設定 ----
IMAGE ?= build-env
SHIELDS := \
  cheakee_left \
  cheakee_left_no_ball \
  cheakee_right_ball_L \
  cheakee_right_ball_LR \
  cheakee_right_ball_R \
  cheakee_right_no_ball

# エイリアス定義: エイリアス名:シールド名
ALIASES := \
  left:cheakee_left \
  left-nb:cheakee_left_no_ball \
  rightL:cheakee_right_ball_L \
  rightLR:cheakee_right_ball_LR \
  rightR:cheakee_right_ball_R \
  right-nb:cheakee_right_no_ball

# デフォルト: 全部実行
.PHONY: all
all: $(SHIELDS)

# イメージビルド
.PHONY: build-image
build-image:
	docker build -t $(IMAGE) .

# 各シールド用ターゲット（正式名）
define RUN_SHIELD
.PHONY: $(1)
$(1): SHIELD=$(1)
$(1): build-image
	@echo ">> Running for SHIELD=$(1) DEBUG=$(DEBUG)"
	docker run --rm \
	  -e SHIELD=$(1) \
	  -e DEBUG=$(DEBUG) \
	  -v $(PWD):/keyboard \
	  $(IMAGE)
endef

$(foreach s,$(SHIELDS), \
  $(eval $(call RUN_SHIELD,$(s))) \
)

.PHONY: %-debug
%-debug:
	$(MAKE) DEBUG=1 $*

# エイリアスマクロ（正式名に依存）
define MAKE_ALIAS
.PHONY: $(1)
$(1): $(2)
endef

# ALIASESからエイリアス展開
$(foreach a,$(ALIASES), \
  $(eval $(call MAKE_ALIAS, \
    $(word 1,$(subst :, ,$a)), \
    $(word 2,$(subst :, ,$a)) \
  )) \
)

.PHONY: reset
reset:
	@echo ">> Running for SHIELD=settings_reset"
	docker run --rm \
	  -e SHIELD=settings_reset \
	  -v $(PWD):/keyboard \
	  $(IMAGE)

.PHONY: clean
clean:
	rm -rf build/*.uf2