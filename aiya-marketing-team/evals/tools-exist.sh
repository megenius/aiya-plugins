#!/usr/bin/env bash
# ด่านที่ล้มได้: เครื่องมือที่ปลั๊กอิน aiya-marketing-team อ้างถึงในเอกสาร (backtick-wrapped)
# ต้องมีอยู่จริงใน apps/api/src (string literal ตรงตัว ไม่ใช่ substring)
# ตรวจเพิ่ม: description ใน SKILL.md ต้อง <= 250 ตัวอักษร (เกินถูกตัดเงียบใน catalog)
# ตรวจเพิ่ม: ห้ามมี em-dash ในปลั๊กอิน
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PLUGIN_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
REPO_ROOT="$(cd "$PLUGIN_DIR/../.." && pwd)"
API_SRC="$REPO_ROOT/apps/api/src"

fail=0

if [ ! -d "$API_SRC" ]; then
  echo "FAIL: หา apps/api/src ไม่เจอที่ $API_SRC (เช็คว่ารันจากทรีที่มีทั้งปลั๊กอินและ apps/api)"
  exit 1
fi

echo "== ตรวจว่าเครื่องมือที่อ้างถึงมีอยู่จริงใน apps/api/src =="

# ดึงชื่อเครื่องมือทุกตัวที่ห่อด้วย backtick ในปลั๊กอิน (ไม่รวม evals/ ของตัวเอง กันจับ pattern ในสคริปต์นี้)
tools="$(grep -rohE '`(mkt|page|brand|product|customer|chat)_[a-zA-Z0-9_]+`' "$PLUGIN_DIR" --exclude-dir=evals \
  | tr -d '`' | sort -u)"

missing=""
while IFS= read -r tool; do
  [ -z "$tool" ] && continue
  # ต้อง match เป็น string literal เป๊ะ ("tool") ไม่ใช่ substring ของชื่ออื่น
  # (กันบั๊กแบบ mkt_outcome ที่จะโดน mkt_outcome_list กลบเงียบๆ ถ้าใช้ grep แบบ substring)
  if ! grep -rqE "\"${tool}\"" "$API_SRC"; then
    missing="${missing}${tool}\n"
    echo "MISSING: \`${tool}\` ถูกอ้างในปลั๊กอิน แต่ไม่มี \"${tool}\" อยู่ใน apps/api/src"
    fail=1
  fi
done <<< "$tools"

if [ "$fail" -eq 0 ]; then
  echo "OK: เครื่องมือทุกตัวที่อ้างถึงมีอยู่จริง ($(echo "$tools" | grep -c .) ตัว)"
fi

echo
echo "== ตรวจความยาว description ใน SKILL.md (ต้อง <= 250 ตัวอักษร) =="

while IFS= read -r skill_file; do
  desc_line="$(grep -m1 '^description:' "$skill_file" || true)"
  [ -z "$desc_line" ] && continue
  desc="${desc_line#description: }"
  len="${#desc}"
  if [ "$len" -gt 250 ]; then
    echo "MISSING: $skill_file description ยาว $len ตัวอักษร เกิน 250"
    fail=1
  fi
done < <(find "$PLUGIN_DIR/skills" -name SKILL.md | sort)

if [ "$fail" -eq 0 ]; then
  echo "OK: description ทุกใบ <= 250 ตัวอักษร"
fi

echo
echo "== ตรวจห้ามมี em-dash ในปลั๊กอิน =="

emdash_hits="$(LC_ALL=C grep -rIl $'\xe2\x80\x94' "$PLUGIN_DIR" || true)"
if [ -n "$emdash_hits" ]; then
  echo "MISSING: พบ em-dash ในไฟล์ต่อไปนี้ (ห้ามใช้)"
  echo "$emdash_hits"
  fail=1
else
  echo "OK: ไม่พบ em-dash"
fi

echo
if [ "$fail" -ne 0 ]; then
  echo "FAIL: ด่านนี้แดง ดูรายการ MISSING ด้านบน"
  exit 1
fi

echo "PASS: ทุกด่านเขียว"
