# CHANGELOG - aiya-chat-team

## 1.0.8-alpha (2026-10-08)

- แก้คำอธิบายปลั๊กอินใน `plugin.json` `marketplace.json` (ทั้งสองไฟล์) และ README ที่ยังเขียนว่าไม่ส่งหาลูกค้าจริงเอง ซึ่งไม่ตรงแล้วตั้งแต่ 1.0.7-alpha เพราะสกิล `setup-auto-reply` เปิด flow ให้บอทตอบลูกค้าเองได้หลังเจ้าของร้านยืนยัน ตอนนี้บอกตรงๆ ว่าร่างข้อความรอคนกดส่ง ส่วนตอบอัตโนมัติตอบเองได้เมื่อเจ้าของยืนยันเปิดใช้ (#5761)

## 1.0.7-alpha (2026-10-06)

- เพิ่มสกิล `edit-bot-reply` แก้ข้อความที่บอทตอบอัตโนมัติ `edit-bot-persona` แก้บุคลิกและค่าระดับช่องทาง และ `setup-auto-reply` ตั้งตอบกลับอัตโนมัติเรื่องใหม่เป็น draft เดิมทีมนี้ร่างได้แต่ข้อความที่ **คน** จะกดส่ง พอบอทตอบผิดเองก็ทำอะไรต่อไม่ได้
- สกิลทั้งสามใบอ้างเฉพาะ tool ของชุด `autoreply` บน connector `aiya-line` (`line_autoreply_*` และ `line_channel_list`) กับ `knowledge_search` จาก `aiya-agents`
- **สิทธิ์เขียนใหม่:** ปลั๊กอินที่เดิมอ่านล้วน ตอนนี้ต้องต่อ connector `aiya-line` (ชุด autoreply, เขียน flow ได้) ไม่ต่อ connector เพจ ด่านกันพลาดอยู่ที่ข้อความในสกิล ไม่ใช่การจำกัดสิทธิ์ที่ connector agent ทั้ง 3 ตำแหน่งยังจำกัด tool อ่านอย่างเดียว
- สกิลบังคับอ่าน flow ของจริงก่อนแก้ เพราะ `line_autoreply_save_graph` เขียนทับทั้งใบ ส่ง node ไม่ครบ = เมนูหายทั้ง flow และห้ามเปิดใช้ flow หรือแก้ flow ที่ใช้งานอยู่โดยเจ้าของไม่ยืนยัน
- `edit-bot-persona` กันพลาดสองอย่าง: เดา `autoReplyMode` ส่งไปโดยไม่ได้ตั้งใจเปลี่ยนโหมด และส่ง `enabledTools` ไม่ครบแล้วเครื่องมือหาย (ฟิลด์นี้ถูกแทนที่ทั้งชุด ต่างจากฟิลด์อื่นที่ระบบ merge ให้)
- การสร้าง flow พร้อมคีย์เวิร์ดอาศัย `line_autoreply_create` / `line_autoreply_update` ที่รับ `keywords` `matchMode` `hwids` `dataPattern` `richMenuAliasId` ได้ (v2 PR #1619 merge แล้ว)

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

- bump เวอร์ชันเป็น 1.0.0-alpha ตามคำสั่งเปิดตัวปลั๊กอินทีมทุกแผนกบน marketplace (Partial #2753)
- CHANGELOG ตามให้ทันของจริง: skill ครบ 8 ใบแล้ว (เพิ่ม `triage-urgency` · `price-and-stock-reply` ·
  `buying-signal-to-sales` ใน #2749, `daily-room-digest` · `apology-and-remedy` ใน #2752) ไม่ใช่แค่
  3 ใบแรกที่ 0.1.0 บันทึกไว้
- เพิ่มรายการ `aiya-chat-team` ใน `plugins/.claude-plugin/marketplace.json` (ไฟล์สำหรับ mirror ขึ้น
  `megenius/aiya-plugins` (ตกหล่นตั้งแต่ #2745 เพราะด่าน `plugin-tools.ts` ตรวจแค่ marketplace.json
  ที่ root ไม่ได้ตรวจไฟล์นี้))
- แก้ชื่อตำแหน่งที่สามที่พิมพ์ผิดใน root `.claude-plugin/marketplace.json` ให้ตรงกับ "หยก"
  (ชื่อจริงตาม README.md และ `team-chat.ts`)

## 0.1.0 (2026-09-15)

- ปลั๊กอินใหม่: ทีมตอบแชท 3 ตำแหน่ง (เนย chat_head · ปิง chat_responder · หยก chat_followup)
  ลอกโครงจาก aiya-marketing-team (Partial #2743)
- agents/*.md ×3 ตรงกับ `team-chat.ts` (tools ต่อคนตรงกับที่ประกาศไว้จริง)
- skill ชุดแรก 3 ใบ: `answer-from-knowledge` · `brand-voice` · `handoff-to-human`
- คำสั่ง `/room-digest` เรียก skill `daily-room-digest` (มาในใบถัดไป)

<!-- mcp-tools -->
ไม่มี tool ที่ต้องประกาศ
<!-- /mcp-tools -->
