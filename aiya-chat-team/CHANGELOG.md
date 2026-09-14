# CHANGELOG - aiya-chat-team

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
