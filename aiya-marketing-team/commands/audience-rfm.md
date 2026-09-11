---
description: Show the 5 customer piles (RFM from real chat data) and which one to act on this week, via the who-first skill
argument-hint: [ชื่อร้าน หรือ workspace ถ้ามีหลายร้าน]
---

# /audience-rfm

แบ่งกองลูกค้าของร้าน $ARGUMENTS โดยให้ agent `analyst` เรียก skill **ใครก่อน (who-first)**

## ขั้นตอน

1. ให้ `analyst` เรียก `customer_segments` ก่อนพูดอะไรทั้งสิ้น อ่านช่อง `dimensions` ตามกฎของ skill (ถ้า `dimensions=2` ต้องเตือนว่ายังไม่มีข้อมูลยอดซื้อ)
2. รายงานเป็น 5 กองตามชื่อกลุ่มของระบบ (7 ชื่อเท่านั้น) พร้อมจำนวนคนและหนึ่งการกระทำต่อกอง
3. เลือกกองเดียวให้ทำสัปดาห์นี้ พร้อมเหตุผลจากตัวเลขจริง
4. ถ้าเจ้าของอยากได้รายชื่อกองที่จะลงมือจริง ให้เรียก `customer_segments` เฉพาะ segment นั้น ไม่เกิน 50 คน ไม่มีเบอร์/อีเมล/รหัสช่องทาง

ห้ามคิดชื่อกลุ่มใหม่ ห้ามเสนอให้ส่งข้อความเอง ทุกรายชื่อที่ได้เป็นแค่ข้อมูลไว้ร่างให้เจ้าของกดส่งเอง

<!-- mcp-tools -->
- `customer_segments`
<!-- /mcp-tools -->
