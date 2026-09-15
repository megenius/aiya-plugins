# CHANGELOG - aiya-ads-team

## 1.0.1-alpha (2026-09-15)

- bump เวอร์ชันเป็น 1.0.1-alpha ตามคำสั่งของ Boy หลังพบว่าแท็บ Agents บน Claude Cowork โผล่แว่บแล้วหาย
  แม้ plugin.json จะประกาศ agents เป็น array ไฟล์แล้วก็ตาม (#2784) ใช้บังคับให้ Cowork รีเฟรช
  cache ของปลั๊กอินจริงอีกรอบ

## 1.0.0-alpha (2026-09-15)

- ปลั๊กอินใหม่ ทีมโฆษณา AIYA 3 ตำแหน่ง (โบว์ ads_lead, ไหม ads_budget, เจ ads_abtest) ตาม `apps/api/src/team-ads.ts`
- skills 6 ใบ: campaign-structure, budget-pacing, ab-test-plan, creative-scorecard, audience-brief, weekly-ads-report
- คำสั่ง `/ads-report`
- ปิดช่องว่างบางส่วนของ #2729 (คู่มือของโบว์ที่ถูกย้ายออกจากทีมการตลาดมีบ้านใหม่แล้ว)

<!-- mcp-tools -->
ไม่มี tool ที่ต้องประกาศ
<!-- /mcp-tools -->
