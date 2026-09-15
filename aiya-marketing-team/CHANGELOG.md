# CHANGELOG - aiya-marketing-team

## Unreleased

- 6 skill ความรู้ LINE Ads (`line-ads-basics` `line-ads-targeting` `line-ads-kpi-benchmark`
  `line-ads-creative-specs` `line-ads-bidding-budget` `line-ads-campaign-workflow`) ดูดจาก
  knowledge/workflows ของ line-ads-mcp (Apache-2.0) เฟส 1 ตาม `positions/PROPOSAL-line-ads-mcp-20260915.md`
  ยังเป็นความรู้/เช็กลิสต์เท่านั้น ระบบยังไม่มีเครื่องมือยิงโฆษณา LINE จริง แบ่งส่งเป็น 2 PR
  (ใบ A #2771: basics/targeting/kpi-benchmark + NOTICE · ใบ B: creative-specs/bidding-budget/campaign-workflow)
  (Closes #2728)

## 1.0.0-alpha (2026-09-15)

- bump เวอร์ชันเป็น 1.0.0-alpha ตามคำสั่งเปิดตัวปลั๊กอินทีมทุกแผนกบน marketplace (Partial #2753)

## 0.6.0 (2026-09-14)

- connector `aiya-agents` ชี้ไปที่ `https://mcp.aiya.me/mcp` แทน `https://agents.aiya.me/mcp` (Partial #2582 · เฟส 0 ย้าย MCP ออกจากโดเมน agents)
- plugin.json บอกจำนวนตำแหน่งตรงกับทีมจริง (9 ตำแหน่งเดิม เป็น 14 ตำแหน่งตาม #2557)
- agent ปลาย (mkt_content) ถือเครื่องมืออ่านของเพจเพิ่ม 3 ตัว (`page_list` `page_insights` `page_calendar_list`) เพื่อดูตัวตนเพจ/โพสต์เก่าก่อนร่าง (Closes #2543 · ยังไม่ได้เขียน/โพสต์เอง)
- agent แนน (mkt_head) ตารางทีมแก้ให้ตรงกับ 14 ตำแหน่งจริง (ก่อนหน้านี้ยังพิมพ์ไว้แค่ 8 คน)

## 0.5.0 (2026-09-14)

- README นับ skill 18 ใบ + bump version (Partial #2529)

## 0.4.1

- agents ชุดที่สอง 4 ตำแหน่ง (มิ้นท์ กัน ตาล ฟ้า) + README ตรงทีม 9 คน

<!-- mcp-tools -->
ไม่มี tool ที่ต้องประกาศ
<!-- /mcp-tools -->
