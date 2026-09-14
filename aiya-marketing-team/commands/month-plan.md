---
description: Build a one-month marketing plan for the shop using the 4 thinking-tool skills
argument-hint: [ชื่อร้าน หรือ workspace ถ้ามีหลายร้าน]
---

# /month-plan

ทำแผนการตลาด 1 เดือนให้ร้าน $ARGUMENTS โดยใช้ agent `marketing-lead`

## ขั้นตอน

1. เรียก skill **จุดเด็ด (winning-zone)** หาจุดขาย 1-2 ข้อ
2. เรียก skill **ใครก่อน (who-first)** เลือกกองลูกค้าที่จะโฟกัสของเดือนนี้
3. เรียก skill **รอยรั่ว (leak)** หาจุดที่ควรแก้ก่อนไปหาลูกค้าใหม่
4. เรียก skill **ลองแล้วรู้ (test-and-learn)** แตกแผนเดือนเป็นการทดลองรายสัปดาห์ (4 สัปดาห์ = อย่างน้อย 1 การทดลอง)
5. สรุปเป็นแผนเดือนเดียว: จุดขายที่ใช้ตลอดเดือน, กองลูกค้าที่โฟกัส, สิ่งที่ต้องแก้ก่อน, และตารางการทดลองรายสัปดาห์
6. ทุกสัปดาห์ในแผนต้องชี้กลับไปที่ใบประกาศผลลัพธ์ (เรียก `mkt_outcome_list` เช็ค) ถ้ายังไม่มีใบประกาศ ให้บอกเจ้าของให้ประกาศก่อน
7. ถ้าร้านต่อ connector `aiya-agents` ไว้ ใช้ `mkt_plan_get` ดูแผนสัปดาห์ที่ระบบขับเคลื่อนต่อได้จริง (คนละชั้นจากปฏิทิน 4 สัปดาห์ในข้อ 5) ยังไม่มี ใช้ `mkt_plan_propose` เสนอ แสดงร่างให้ดูก่อนเสมอ · ให้เจ้าของกด `mkt_plan_approve` เองเท่านั้น (P2) หลังอนุมัติ `mkt_creative_run`/`mkt_handoff_run`/`mkt_queue_run` พาโพสต์ไปถึงขั้น "รอเจ้าของกด" โดยไม่ publish เอง

ห้ามข้ามขั้นไหนแม้ผู้ใช้เร่ง ถ้าข้อมูลไม่พอให้บอกตรงๆ ว่ายังตอบไม่ได้ตรงไหน แทนที่จะแต่งแผนที่ดูสวย

<!-- mcp-tools -->
- `mkt_outcome_list`
- `mkt_plan_get`
- `mkt_plan_propose`
- `mkt_plan_approve`
- `mkt_creative_run`
- `mkt_handoff_run`
- `mkt_queue_run`
<!-- /mcp-tools -->
