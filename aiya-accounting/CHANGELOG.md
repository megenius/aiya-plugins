# CHANGELOG - aiya-accounting

## 1.0.11-alpha (2026-10-27)

- connector ใหม่ชื่อ `aiya-acct` ชี้ https://mcp.aiya.me/acct มีเฉพาะเครื่องมือบัญชี + เครื่องมือกลางของร้าน · หลังอัปเดตต้องล็อกอิน connector ใหม่ 1 ครั้ง
- คนที่ใช้ connector เดิม `aiya-agents` (https://mcp.aiya.me/mcp) อยู่แล้ว: **ไม่ต้องลบ** เก็บไว้ได้ ใช้ได้ทั้งคู่ เพราะ /mcp ยังเสิร์ฟเครื่องมือบัญชีครบ จนกว่าเราจะประกาศปิดล่วงหน้า · ถ้าอยากให้รายการสั้นลง ลบตัวเดิมออกได้หลังล็อกอิน `aiya-acct` แล้ว

## 1.0.10-alpha (2026-10-11)

- ย้าย connector `aiya-agents` กลับไปชี้ `https://mcp.aiya.me/mcp` (#3999) วันนี้พิสูจน์จาก URL จริงแล้วว่า discovery ของทั้งสองโฮสต์ประกาศ resource = `https://mcp.aiya.me/mcp` ตรงกัน ไคลเอนต์ที่เข้มงวดจึงไม่ปฏิเสธ connector นี้อีก bump เวอร์ชันตาม
- คู่มือปิดเดือน (`skills/acct-month-close` และคำสั่ง `ปิดเดือน`) ที่แก้ไว้แล้วขึ้นพร้อมเวอร์ชันนี้: ทุกคำตอบต้องมีบล็อกสถานะ 4 บรรทัด (#6911) ร้านที่ใช้สมุดบัญชีจาก ERP ดึงงบทดลองด้วย `acct_trial_balance` และกฎข้อ 14 ระบุข้อยกเว้นของการปิดเดือน (#6913) บอกว่า "ยังไม่มีเครื่องมือ" ได้เฉพาะเมื่อเครื่องมือตอบรหัส `ERP_APP_FORBIDDEN` เท่านั้น รหัสอื่นให้บอกว่ายังดึงไม่ได้พร้อมเหตุผล และบรรทัดตัวอย่างใช้ไอคอนสถานะชุดเดียวกัน (#6919)

## 1.0.9-alpha (2026-10-07)

- bump เวอร์ชันเพื่อส่งคู่มือ `references/erp-books.md` (เครื่องมือสมุด/งบจาก ERP 8 ตัว · #5101) ขึ้นรอบ publish นี้ (Boy ขอผ่านสี่ถัง 7 ต.ค.)

## 1.0.7-alpha (2026-10-01)

- `acct-peak-import`: ถอดบรรทัดชั่วคราวที่บอกว่า `sale_taxInvoice_` ยังนำเข้าไม่ได้ (api #4088 · acc #4089 ขึ้น prod แล้ว · #4082) เพิ่มวิธีอ่านสรุปไฟล์ใบกำกับภาษีขาย: แยก `invoice_total_satang` กับ `credit_note_total_satang` (ใบลดหนี้ลดยอด ห้ามรายงานเป็นยอดรวมเดียว) · มี `credit_notes_new` ให้เตือนตรวจกับฝ่ายบัญชีก่อนยืนยัน · `changed_rows` ต้องบอกก่อนยืนยันเสมอ · ย้ำห้าม AI เรียก apply เอง

## 1.0.6-alpha (2026-10-01)

- ประกาศ tool `acct_*` และ `ar_*` ที่มีในชุด /acct ของ MCP แต่ยังไม่อยู่ในบล็อกประกาศ tool อีก 31 ตัว (#4083 · จาก #3859 ข้อ 4) ไม่รวม `au_*` ที่ย้ายไป /agents
  - สกิลใหม่ `acct-peak-import`: `acct_peak_import` `acct_peak_import_apply` เขียนชัดว่าใช้กับไฟล์เล็กเท่านั้น ไฟล์รายเดือนให้ไปหน้า https://acc.aiya.me/peak/import และห้ามแนะนำ `file_url` กับลิงก์สาธารณะ
  - `acct-ar-billing`: `acct_agp_bl_open` `ar_charge_list` `ar_annual_summary` `ar_annual_run_build` `ar_ledger_sync_dry_run` `ar_unit_unlink` `ar_unit_internal` `ar_invoice_issued` `ar_invoice_cancel` `ar_run_reopen` `acct_legacy_invoice_list` `acct_legacy_invoice_mark` `acct_manual_invoice_list` `acct_manual_invoice_get` `acct_manual_invoice_review` `acct_manual_invoice_issue_external`
  - `acct-peak-compare`: `acct_ledger_compare` `acct_ledger_cache_sync` `acct_receive_payment_sync` `acct_peak_billing_note_void`
  - `acct-pay-request`: `acct_pay_request_unlink_bank_txn` `acct_pay_request_item_link_vendor` `acct_pay_request_void`
  - `acct-bank-lookup`: `acct_statement_import` (ตัวตน AI ทำได้แค่รอบดู · แก้ข้อความเดิมที่บอกว่าไม่มีเครื่องมือนำเข้า) · คำสั่ง รับเงิน: `acct_bank_match_unset` `acct_bank_txn_exempt_unset`
  - `acct-tax-calendar`: `acct_tax_filing_record` · `acct-cash-desk`: `acct_ap_by_vendor` · `acct-vendor-onboard`: `acct_vendor_billing_rounds`
  - tool ที่ตัวตน AI เรียกไม่ได้ (void, cancel, reopen, apply, issue_external, filing_record) ระบุในคู่มือว่าต้องเป็นคนสั่ง
- ไม่แก้ `.mcp.json` (การย้ายไป /acct รอ #4004)

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

## 0.3.0 (2026-09-14)

- connector `aiya-agents` ชี้ไปที่ `https://mcp.aiya.me/mcp` แทน `https://agents.aiya.me/mcp` (Partial #2582 · เฟส 0 ย้าย MCP ออกจากโดเมน agents)
- README แก้ URL connector ให้ตรงกับ `.mcp.json`

## 0.2.3 และก่อนหน้า

ดูประวัติเต็มที่ `git log -- plugins/aiya-accounting/` (ยังไม่มี CHANGELOG.md ไฟล์นี้ก่อนเวอร์ชันนี้)

<!-- mcp-tools -->
ไม่มี tool ที่ต้องประกาศ
<!-- /mcp-tools -->

## 0.3.0 (2026-09-14)

- ตัวเชื่อมต่อ aiya-agents ย้ายที่อยู่ (ภายหลังย้อนกลับใน 1.0.5-alpha)
- README แก้ที่อยู่ตัวเชื่อมต่อให้ตรงกับไฟล์ตั้งค่า

## 0.2.3 และก่อนหน้า

ประวัติรุ่นก่อนหน้านี้ไม่ได้บันทึกไว้ในไฟล์นี้

<!-- mcp-tools -->
ไม่มี tool ที่ต้องประกาศ
<!-- /mcp-tools -->
