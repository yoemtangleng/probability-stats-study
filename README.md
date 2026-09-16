# 概率统计 学习助手

北航「概率统计A」课程（2026秋季学期）的 AI 学习伙伴，改造自 CFP-Study 项目的引导式学习方法（Guided Learning）。

## 这是什么

不是简单的答疑机器人，而是：
- 概念类问题用苏格拉底式提问，建立真正的理解而不是背答案
- 解题类问题（作业/计算题）用分步骤引导，最终给出可直接誊抄进作业本的整洁解答
- 每次学习对话记录 session notes，更新唯一的进度总账 `/progress/probability-stats-tracker.md`
- 涉及计算的题目，倾向生成可交互、KaTeX 渲染公式的分步解题展示

具体教学规则都写在 `CLAUDE.md` 里。

## 两种用法

### 方式一：本地 Claude Code 仓库

```bash
cd 概率统计-Study
claude-code
```

直接开始问概率统计相关的问题，Claude 会：
- 按 `CLAUDE.md` 里的方法引导你
- 把每次讨论记录进 `/sessions/`
- 更新 `/progress/probability-stats-tracker.md`
- 把分步解题生成的 HTML 存进 `/solutions/`（用浏览器直接打开）

每周把老师发的新 PPT/PDF 放进 `/materials/`，下次对话时提一句"我上传了新材料"，Claude 会读取并更新进度大纲。

### 方式二：claude.ai Project 内使用

把 `claude-ai-project-instructions.md` 的内容复制粘贴进这个 Project（概率统计 学习）的「Project 说明 / Custom instructions」里。

在这种用法下：
- 不需要手动维护 session notes/tracker 文件——claude.ai 的记忆功能会在每轮对话后自动记住掌握的知识点、遇到的知识缺口、作业进度，下次对话自动带入
- 每周课程材料直接作为 Project 知识文件上传（而不是放进 `/materials/` 文件夹）
- 解题时会用 artifact（可交互 HTML/React + KaTeX）展示分步过程

两种方式可以同时用：平时在 claude.ai 上问问题、刷作业；考前想要一份完整、结构化的复习仓库时，把这套 CLAUDE.md 体系下载下来喂给 Claude Code，回顾所有 session。

## 仓库结构

```
/materials/          # 每周课程材料（PPT/PDF），需要手动放入
/solutions/          # 生成的分步解题 HTML
/sessions/           # 每次学习对话的详细记录
/progress/
  probability-stats-tracker.md      # 唯一进度总账
CLAUDE.md                            # 教学方法与规则（本地 Claude Code 用）
claude-ai-project-instructions.md    # 精简版，贴进 claude.ai Project 说明用
README.md                            # 本文件
```

## 目前进度

已收到第1讲材料（课程介绍 + 1.1 随机事件与样本空间）。查看 `/progress/probability-stats-tracker.md` 获取最新详情。
