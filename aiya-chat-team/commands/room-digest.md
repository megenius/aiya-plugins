---
description: Owner-facing daily digest of chat room health across every channel
argument-hint: [ชื่อร้าน หรือ workspace ถ้ามีหลายร้าน]
---

# /room-digest

สรุปสุขภาพการตอบแชทของร้าน $ARGUMENTS วันนี้ ให้ agent เนย (chat_head) ทำ ใช้ skill **daily-room-digest**

## ขั้นตอน

1. เรียก skill **daily-room-digest** ให้เนยดึงภาพรวมห้อง เวลาตอบ และห้องที่ต้องรีบ
2. สรุปให้เจ้าของร้านเป็นภาษาคน ไม่เกิน 5 บรรทัด
3. ปิดท้ายด้วยหัวข้อ "ยังไม่รู้" เสมอ

<!-- mcp-tools -->
ไม่มี tool ที่ต้องประกาศ
<!-- /mcp-tools -->
