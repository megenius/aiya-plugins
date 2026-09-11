#!/bin/bash
# ด่านชั้น 1 ของ "ประตูอนุมัติ" (SPEC-cowork-plugin-accounting-20260911 §6)
# บังคับ decision=ask ทุกครั้งที่ agent จะเรียก tool ที่กระทบเงิน/เอกสารทางการ/ลูกค้า/ยอดที่บันทึกแล้ว
# ค่านี้เป็นค่าตั้งต้นที่รอ Boy เคาะ (สเปก §8 ข้อ 2 ยังไม่ปิด) · 23 tools ตาม matcher ใน hooks.json
input=$(cat)
tool_name=$(echo "$input" | grep -o '"tool_name"[[:space:]]*:[[:space:]]*"[^"]*"' | sed -E 's/.*:[[:space:]]*"([^"]*)"/\1/')

reason="รายการนี้อยู่ในกลุ่มเงิน/เอกสารทางการ/ลูกค้า/แก้ยอดที่บันทึกแล้ว ต้องให้คนกดยืนยันเอง (ACCT_TEAM_RULES ข้อ 2)"
case "$tool_name" in
  acct_pay_request_submit|acct_pay_request_approve|acct_pay_request_reject|acct_pay_request_void|acct_pay_request_unapprove|acct_pay_request_mark_paid)
    reason="เงิน: เปลี่ยนสถานะใบตั้งเบิกที่กระทบการอนุมัติ/การจ่าย ถอนคืนไม่ได้ในเชิงควบคุมภายใน" ;;
  acct_pay_request_link_bank_txn)
    reason="แก้ยอดที่บันทึกแล้ว: ผูกเงินออกจริงเข้ากับใบ ผูกผิดใบ = หลักฐานผิด" ;;
  acct_statement_import)
    reason="เงิน: นำเข้ายอดเงินบริษัทเข้าระบบ กระทบภาพเงินสดทั้งกระดาน" ;;
  acct_tax_profile_set)
    reason="เอกสารทางการ: ข้อเท็จจริงทางกฎหมายของกิจการ ตอบผิด = ยื่นภาษีผิด" ;;
  acct_bank_txn_exempt_set|acct_bank_txn_exempt_unset)
    reason="เงิน: ตัดรายการออกจากภาพเงินสด ต้องเป็นคนติ๊กเท่านั้น (PLAN-CASH §0)" ;;
  acct_bank_match_set|acct_bank_match_unset)
    reason="แก้ยอดที่บันทึกแล้ว: คู่เงินที่คนยืนยัน ผูก/ถอนผิดคู่ = กระทบยอดผิด" ;;
  acct_cash_account_set)
    reason="เงิน: ขึ้นทะเบียนบัญชี กระทบภาพสภาพคล่องทั้งกระดาน (PLAN-CASH §1)" ;;
  acct_company_doc_add)
    reason="เอกสารทางการ: เอกสารที่ส่งให้ลูกค้าอ้างอิงได้" ;;
  acct_legacy_invoice_mark)
    reason="เอกสารทางการ: ผูกกับเอกสารจริงใน PEAK" ;;
  acct_peak_billing_note_void)
    reason="เอกสารทางการ+ลูกค้า: ยกเลิกเอกสารจริงใน PEAK สั่งเป็นใบๆ เท่านั้น (PLAN-ACCOUNTING §7)" ;;
  ar_unit_link|ar_unit_unlink)
    reason="ลูกค้า: ผูกหน่วยกับลูกค้าผิด = บิลผิดคน" ;;
  ar_invoice_issue_external)
    reason="เงิน+เอกสารทางการ+ลูกค้า: ออกใบจริงหา PEAK/FlowAccount ส่งถึงลูกค้าแล้ว" ;;
  ar_invoice_cancel)
    reason="เอกสารทางการ: ยกเลิกใบที่ออกแล้ว" ;;
  ar_run_close|ar_run_reopen)
    reason="แก้ยอดที่บันทึกแล้ว: ล็อก/ปลดล็อกงวดวางบิล" ;;
esac

printf '{"decision":"ask","reason":"%s"}\n' "$reason"
