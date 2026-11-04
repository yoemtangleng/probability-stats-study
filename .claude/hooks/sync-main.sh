#!/bin/bash
# 每次开 session 时，把 GitHub 上最新的 main 同步到本地。
# 目的：让 CLAUDE.md 里的规则（表达规范等）在 Jackson 电脑上的旧 session 里也生效。
#
# 安全原则（宁可不更新，也不弄坏本地文件）：
#   - 只在工作区完全干净时才更新
#   - 只做「快进」合并（--ff-only）。如果本地有 main 上没有的提交，就什么都不做
#   - 任何一步失败都静默退出，不影响 session 启动

cd "${CLAUDE_PROJECT_DIR:-.}" 2>/dev/null || exit 0
git rev-parse --git-dir >/dev/null 2>&1 || exit 0

git fetch origin main --quiet 2>/dev/null || exit 0

# 工作区有未提交的改动：不动它
[ -z "$(git status --porcelain 2>/dev/null)" ] || exit 0

before="$(git rev-parse HEAD 2>/dev/null)"
git merge --ff-only origin/main --quiet 2>/dev/null || exit 0
after="$(git rev-parse HEAD 2>/dev/null)"

# 没有变化：安静退出
[ "$before" != "$after" ] || exit 0

echo "已从 GitHub main 同步到最新（${before:0:7} -> ${after:0:7}）。"

# CLAUDE.md 若在这次更新里变了，session 可能已经读过旧版。
# 把新版直接输出到上下文里，保证新规则这次就生效。
if ! git diff --quiet "$before" "$after" -- CLAUDE.md 2>/dev/null; then
  echo "CLAUDE.md 有更新，以下是最新版全文，请以它为准："
  echo "-----"
  cat CLAUDE.md
fi

exit 0
