<div align="center">

<!-- 隐藏的 checkbox: 未勾选=英文，勾选=中文 -->
<input type="checkbox" id="lang-toggle" style="display:none;">

<!-- 按钮组: 点击 label 切换 checkbox 状态 -->
<p>
  <label for="lang-toggle" id="btn-en" style="background:#2da44e;color:#fff;border-radius:6px 0 0 6px;padding:4px 14px;font-size:14px;cursor:pointer;user-select:none;display:inline-block;">🇬🇧 English</label>
  <label for="lang-toggle" id="btn-cn" style="background:#d0d7de;color:#1f2328;border-radius:0 6px 6px 0;padding:4px 14px;font-size:14px;cursor:pointer;user-select:none;display:inline-block;margin-left:-5px;">🇨🇳 中文</label>
</p>

</div>

<!-- 英文标题 -->
<h1 id="title-en">ALED Tech Trend Scoreboard</h1>
<p id="sub-en" style="color:#656d76;">Multi-source entropy signal system — early trend detection</p>

<div id="en-content">

### 📋 What This Is

Daily public multi-source signal scan (GitHub Issues, academic papers, job boards, YC RFS, Dev.to, Stack Overflow) → structural entropy scoring → early trend detection. Currently in **data accumulation phase** — daily scoreboards while statistical validation builds.

### 🔬 Capabilities
- Detect technology concepts before mainstream adoption
- Cross-source signal validation
- Information-theoretic structural entropy measurement
- Automated prediction verification (30/60/90 day windows)

### 📊 Daily Reports

Published each day at ~06:00 UTC+8 in [`daily/`](daily/) directory.

- [English scoreboards](daily/)
- [Chinese scoreboards](daily/cn/)
- [Signal counts per concept](daily/signal_counts/)
- [Source titles per concept](daily/signal_sources/)

### 📬 Contact

[shenhaiceshi2026@126.com](mailto:shenhaiceshi2026@126.com)

---

<sub>Powered by multi-source entropy signals. Non-exclusive buyout licensing.</sub>

</div>

<!-- 中文内容 -->
<h1 id="title-cn">ALED 趋势看板</h1>
<p id="sub-cn" style="color:#656d76;">多源熵信号系统 — 早期趋势检测</p>

<div id="cn-content">

### 📋 这是什么

每日扫描多源公开信号（GitHub Issues、学术论文、招聘、YC RFS、Dev.to、Stack Overflow）→ 结构熵评分 → 早期趋势检测。目前处于**数据积累初期**，每日产出看板，统计验证同步累积。

### 🔬 能力
- 在技术概念成为主流前检测结构变化
- 跨源交叉验证
- 基于信息论的结构熵测量
- 30/60/90天预言自动验证

### 📊 每日报告

每天 ~06:00 UTC+8 更新，存放在 [`daily/`](daily/) 目录。

- [英文看板](daily/)
- [中文看板](daily/cn/)
- [概念信号量](daily/signal_counts/)
- [原始标题清单](daily/signal_sources/)

### 📬 联系方式

[shenhaiceshi2026@126.com](mailto:shenhaiceshi2026@126.com)

---

<sub>基于多源熵信号。非独家买断制授权。</sub>

</div>

<style>
/* 未勾选 → 显示英文，隐藏中文 */
#lang-toggle:not(:checked) ~ #title-en,
#lang-toggle:not(:checked) ~ #sub-en,
#lang-toggle:not(:checked) ~ #en-content {
  display: block !important;
}
#lang-toggle:not(:checked) ~ #title-cn,
#lang-toggle:not(:checked) ~ #sub-cn,
#lang-toggle:not(:checked) ~ #cn-content {
  display: none !important;
}

/* 已勾选 → 显示中文，隐藏英文 */
#lang-toggle:checked ~ #title-en,
#lang-toggle:checked ~ #sub-en,
#lang-toggle:checked ~ #en-content {
  display: none !important;
}
#lang-toggle:checked ~ #title-cn,
#lang-toggle:checked ~ #sub-cn,
#lang-toggle:checked ~ #cn-content {
  display: block !important;
}

/* 按钮高亮 */
#lang-toggle:not(:checked) ~ p #btn-en {
  background: #2da44e !important;
  color: #fff !important;
}
#lang-toggle:not(:checked) ~ p #btn-cn {
  background: #d0d7de !important;
  color: #1f2328 !important;
}
#lang-toggle:checked ~ p #btn-cn {
  background: #2da44e !important;
  color: #fff !important;
}
#lang-toggle:checked ~ p #btn-en {
  background: #d0d7de !important;
  color: #1f2328 !important;
}
</style>
