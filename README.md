<div align="center">

<h1 id="title-en" style="margin-bottom:0;">ALED Tech Trend Scoreboard</h1>
<h1 id="title-cn" style="margin-bottom:0;display:none;">ALED 趋势看板</h1>
<p id="sub-en" style="color:#656d76;margin-top:4px;">Multi-source entropy signal system — early trend detection</p>
<p id="sub-cn" style="color:#656d76;margin-top:4px;display:none;">多源熵信号系统 — 早期趋势检测</p>

<p>
  <button onclick="switchLang('en')" id="btn-en" style="background:#2da44e;color:#fff;border:none;border-radius:6px;padding:4px 14px;font-size:14px;cursor:pointer;margin:2px;">🇬🇧 English</button>
  <button onclick="switchLang('cn')" id="btn-cn" style="background:#d0d7de;color:#1f2328;border:none;border-radius:6px;padding:4px 14px;font-size:14px;cursor:pointer;margin:2px;">🇨🇳 中文</button>
</p>

</div>

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

<div id="cn-content" style="display:none;">

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

<script>
function switchLang(lang) {
  document.getElementById('en-content').style.display = lang === 'en' ? 'block' : 'none';
  document.getElementById('cn-content').style.display = lang === 'cn' ? 'block' : 'none';
  document.getElementById('title-en').style.display = lang === 'en' ? 'block' : 'none';
  document.getElementById('title-cn').style.display = lang === 'cn' ? 'block' : 'none';
  document.getElementById('sub-en').style.display = lang === 'en' ? 'block' : 'none';
  document.getElementById('sub-cn').style.display = lang === 'cn' ? 'block' : 'none';
  document.getElementById('btn-en').style.background = lang === 'en' ? '#2da44e' : '#d0d7de';
  document.getElementById('btn-cn').style.background = lang === 'cn' ? '#2da44e' : '#d0d7de';
  document.getElementById('btn-en').style.color = lang === 'en' ? '#fff' : '#1f2328';
  document.getElementById('btn-cn').style.color = lang === 'cn' ? '#fff' : '#1f2328';
}
</script>
