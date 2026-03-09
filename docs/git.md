# Git 提交规范

## 提交消息格式

```
<type>(<scope>): <subject>
```

- `type`（必填）：提交类型
- `scope`（可选）：影响范围
- `subject`（必填）：简短描述

## 常用类型

- `feat`: 新功能
- `fix`: 修复 bug
- `docs`: 文档更新
- `style`: 代码格式调整（不影响功能）
- `refactor`: 重构代码
- `test`: 测试相关
- `chore`: 构建/工具/依赖更新

## 示例

```bash
feat: 添加用户登录功能
fix: 修复页面加载错误
docs: 更新 README 文档
chore: 升级依赖版本
feat(api): 添加用户接口
fix(ui): 修复按钮样式问题
```

## 注意事项

- subject 使用中文或英文均可
- subject 不要以句号结尾
- 使用祈使句，如"添加"而不是"添加了"
