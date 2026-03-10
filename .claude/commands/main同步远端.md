---
name: main同步远端
description: main同步远端
allowed-tools: Read, Write, Bash, WebFetch
---


# 说明
- main合并main--origin，通过rebase

## 有冲突的时候
- 以远端main--origin为准，main通过看log判断之前修改意图，然后将代码补上去