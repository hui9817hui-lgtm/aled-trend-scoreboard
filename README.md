# ALED Tech Trend Scoreboard

每日自动采集五源信号 → ALED 五维评分 → 每日趋势排名

**数据源 / Sources:**
- GitHub Issues（开发者痛点）
- OpenAlex（学术论文）
- RemoteOK / We Work Remotely（招聘需求）
- YC RFS（创业投资方向）
- 综合问题空间（Stack Overflow / Dev.to）

**联系 / Contact:** shenhaiceshi2026@126.com

---

ALED is an automated tech trend scoring engine. It collects signals from 5 public data sources daily, evaluates concepts across 5 dimensions, and outputs a ranked scoreboard.

**The 5 dimensions:**
- Fragmentation — how many independent players in the space
- Glue Density — integration/adapter demand within the ecosystem
- Naming Entropy — clarity of concept boundaries
- Expansion Dependency — growth decoupled from existing systems
- Compression Potential — abstraction/standardization potential

**Daily outputs:**
- `daily/` — scoredboard (markdown), English
- `daily/en/` — detailed report (JSON), English
- Validation reports tracking prediction accuracy

### Getting the data

Daily scoreboards are publicly available in the `daily/` directory. For raw JSON data or historical access, contact shenhaiceshi2026@126.com.
