# 钙钛矿称量计算器

一个交互式网页小程序，可部署到 GitHub Pages，并可通过 Supabase 集中保存所有用户提交的称量记录。

## 功能

- 根据 FA / MA / Cs / Br 比例、Pb 摩尔浓度和溶液体积计算 FAI、MAI、CsI、PbI2、PbBr2、RbCl 的称量质量。
- 分子量内置且可修改。
- 保存本次填写记录，记录会带时间戳。
- 配置 Supabase 后，所有用户保存的记录会集中保存到云端并在页面中共享显示。
- 未配置 Supabase 时，记录会暂存在当前浏览器的 localStorage 中。
- 支持导出记录为 CSV。

## 云端记录配置

1. 打开 Supabase，新建一个项目。
2. 在 Supabase SQL Editor 中运行 `supabase-schema.sql`。
3. 在 Supabase 项目设置里找到 Project URL 和 anon public key。
4. 修改 `cloud-config.js`：

```js
window.PEROVSKITE_CLOUD = {
  supabaseUrl: "https://你的项目编号.supabase.co",
  supabaseAnonKey: "你的 Supabase anon public key"
};
```

`anon public key` 会放在网页中公开使用，这是 Supabase 的正常用法。表权限由 `supabase-schema.sql` 中的 RLS policy 控制：匿名用户只能读取和新增记录，不能更新或删除云端记录。

## 本地使用

直接双击打开 `perovskite-weighing-calculator.html`，或打开 `index.html`。

## GitHub Pages 发布

仓库推送到 GitHub 后，在仓库 Settings -> Pages 中选择：

- Source: Deploy from a branch
- Branch: `main`
- Folder: `/root`

保存后等待 GitHub Pages 构建完成，即可获得可分享网页链接。
