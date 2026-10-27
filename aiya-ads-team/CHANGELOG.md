# CHANGELOG - aiya-ads-team

## 1.0.9-alpha (2026-10-28)

- ถ้าร้านยังไม่ได้เปิดสิทธิ์ "พนักงาน AI ตอบแชท" (ไม่เห็นเครื่องมือ mkt_) ทีมจะบอกตรงๆ แทนการแกล้งทำว่าเรียกได้ · ไม่ต้องทำอะไรเพิ่ม

## 1.0.8-alpha (2026-10-28)

- Connector moves to https://mcp.aiya.ai/mkt: log in once more; the old mcp.aiya.me connector keeps working.

## 1.0.7-alpha (2026-10-27)

- เปลี่ยนชื่อ agent จาก _ เป็น - (เช่น mkt_brand เป็น mkt-brand) เพราะ Claude Desktop เตือนว่าชื่อ agent ที่มี _ ไม่ถูกรูปแบบ · ไม่ต้องทำอะไรเพิ่ม อัปเดตปลั๊กอินแล้วคำเตือนหายไป

## 1.0.6-alpha (2026-10-11)

- ย้าย connector `aiya-agents` กลับไปชี้ `https://mcp.aiya.me/mcp` (#3999) วันนี้พิสูจน์จาก URL จริงแล้วว่า discovery ของทั้งสองโฮสต์ประกาศ resource = `https://mcp.aiya.me/mcp` ตรงกัน ไคลเอนต์ที่เข้มงวดจึงไม่ปฏิเสธ connector นี้อีก bump เวอร์ชันตาม

## 1.0.5-alpha (2026-09-27)

- ย้าย connector `aiya-agents` กลับไปชี้ `https://agents.aiya.me/mcp` (#2807) เอนทรี 1.0.4-alpha ด้านล่างที่บอกว่าย้ายกลับ `mcp.aiya.me/mcp` แล้ว **เขียนเร็วเกินไป** v2#922 และ #2977 (เงื่อนไขที่ต้องขึ้น prod ก่อน) ยังไม่ได้ deploy จริง discovery ของ mcp.aiya.me ยังชี้ authorization server ผิดตัวให้ connector นี้อยู่ ใช้ `agents.aiya.me/mcp` แทนจนกว่าทั้งสองใบนั้นขึ้น prod แล้วพิสูจน์ discovery ตรงกัน

## 1.0.4-alpha (2026-09-20)

- ย้าย connector `aiya-agents` กลับไปชี้ `https://mcp.aiya.me/mcp` (#2807 ขั้นสุดท้าย) หลัง v2#922 และ #2977 ขึ้น prod แล้ว (discovery ของ mcp.aiya.me ไม่กำกวมอีก) bump เวอร์ชันตาม

## 1.0.3-alpha (2026-09-15)

- bump เวอร์ชันเป็น 1.0.3-alpha (Boy สั่ง) รวมการแก้ connector `aiya-agents` ให้ชี้ `https://agents.aiya.me/mcp` (#2808) เข้ากับรอบ publish นี้ ป้องกัน cache เก่าของ Cowork/Claude Code ที่ผูกกับเลขเวอร์ชันเดิม

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
