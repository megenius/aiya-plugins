# CHANGELOG - aiya-accounting

## 1.0.3-alpha (2026-09-15)

- bump เวอร์ชันเป็น 1.0.3-alpha (Boy สั่ง) รวมการแก้ connector `aiya-agents` ให้ชี้ `https://agents.aiya.me/mcp` (#2808) เข้ากับรอบ publish นี้ ป้องกัน cache เก่าของ Cowork/Claude Code ที่ผูกกับเลขเวอร์ชันเดิม

## 1.0.1-alpha (2026-09-15)

- bump เวอร์ชันเป็น 1.0.1-alpha ตามคำสั่งของ Boy หลังพบว่าแท็บ Agents บน Claude Cowork โผล่แว่บแล้วหาย
  แม้ plugin.json จะประกาศ agents เป็น array ไฟล์แล้วก็ตาม (#2784) ใช้บังคับให้ Cowork รีเฟรช
  cache ของปลั๊กอินจริงอีกรอบ

## 1.0.0-alpha (2026-09-15)

- bump เวอร์ชันเป็น 1.0.0-alpha ตามคำสั่งเปิดตัวปลั๊กอินทีมทุกแผนกบน marketplace (Partial #2753)

## 0.3.0 (2026-09-14)

- connector `aiya-agents` ชี้ไปที่ `https://mcp.aiya.me/mcp` แทน `https://agents.aiya.me/mcp` (Partial #2582 · เฟส 0 ย้าย MCP ออกจากโดเมน agents)
- README แก้ URL connector ให้ตรงกับ `.mcp.json`

## 0.2.3 และก่อนหน้า

ดูประวัติเต็มที่ `git log -- plugins/aiya-accounting/` (ยังไม่มี CHANGELOG.md ไฟล์นี้ก่อนเวอร์ชันนี้)

<!-- mcp-tools -->
ไม่มี tool ที่ต้องประกาศ
<!-- /mcp-tools -->
