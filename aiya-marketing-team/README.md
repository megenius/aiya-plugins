# aiya-marketing-team

ปลั๊กอิน Claude Cowork / Claude Code สำหรับทีมการตลาด AI ของร้านค้า AIYA
รวมเครื่องมือคิดการตลาด 4 ใบ (จากเพลย์บุ๊ก `positions/PLAYBOOK-mar-thinking-tools-20260910.md`)
+ ตัวช่วยวางแผน + ตัวช่วยร่างโพสต์เพจผ่าน connector AiPage

## ติดตั้ง

### Claude Cowork

1. เปิดหน้าตั้งค่า Plugin ของ Cowork
2. เพิ่ม marketplace จาก repo นี้: `megenius/aiya-platform-v3`
3. ติดตั้งปลั๊กอิน `aiya-marketing-team`

### Claude Code (CLI)

```
/plugin marketplace add megenius/aiya-platform-v3
/plugin install aiya-marketing-team@aiya
```

ชื่อ `aiya` มาจากชื่อ marketplace ใน `plugins/.claude-plugin/marketplace.json` ของ repo นี้
ถ้าเปลี่ยนชื่อ marketplace ในอนาคต ให้เช็คชื่อจริงจากไฟล์นั้นก่อนสั่งติดตั้ง

## วิธีล็อกอิน connector (aiya-page)

ปลั๊กอินนี้ต่อกับ AiPage ผ่าน remote MCP `https://mcp.aiya.me/page` ต้องล็อกอินแบบ OAuth ครั้งแรกก่อนใช้

1. หลังติดตั้งปลั๊กอิน เปิดหน้าจัดการ MCP connector ของ Claude (ใน Claude Code ใช้ `/mcp` แล้วเลือก `aiya-page`)
2. กด login/authorize แล้วล็อกอินด้วยบัญชี AIYA ของร้าน (เหมือนที่ล็อกอินหน้า workspace/page ของ AIYA)
3. ยืนยันสิทธิ์ (scope) ที่ขอ แล้วกลับมาที่ Claude เมื่อเห็นสถานะ connected แปลว่าใช้งานได้

ถ้า connector ขึ้นว่าไม่ต่อติดหรือหมดอายุ ต้อง login ใหม่ผ่านขั้นตอนเดียวกัน agent `page-admin`
จะบอกตรงๆ เมื่อเรียกเครื่องมือแล้วเจอปัญหานี้ ไม่แกล้งทำว่าทำงานสำเร็จ

## เดโม 3 ขั้น

1. **วางแผนเดือน** พิมพ์ `/month-plan` ระบบจะเรียก agent `marketing-lead` ใช้เครื่องมือคิด 4 ใบ
   (จุดเด็ด → ใครก่อน → รอยรั่ว → ลองแล้วรู้) แล้วสรุปเป็นแผน 1 เดือน
2. **ร่างโพสต์** พิมพ์ `/draft-post <หัวข้อ>` ระบบจะเรียก agent `page-admin` ร่างโพสต์ตามจุดขายและเสียงแบรนด์ร้าน
   แสดงร่างให้ดูก่อนเสมอ **ไม่ publish จนกว่าจะพิมพ์ยืนยัน**
3. **ดูผลสัปดาห์** พิมพ์ `/weekly-review` ระบบจะสรุปผลสัปดาห์นี้เป็นภาษาคน 3 ข้อ จากตัวเลขจริงเท่านั้น

## โครงสร้าง

```
aiya-marketing-team/
├── .claude-plugin/plugin.json
├── .mcp.json                    # connector aiya-page = https://mcp.aiya.me/page
├── skills/
│   ├── winning-zone/SKILL.md    # จุดเด็ด - พูดอะไร
│   ├── who-first/SKILL.md       # ใครก่อน - พูดกับใคร (RFM)
│   ├── leak/SKILL.md            # รอยรั่ว - เงินรั่วตรงไหน
│   └── test-and-learn/SKILL.md  # ลองแล้วรู้ - ดีขึ้นได้ยังไง
├── agents/
│   ├── marketing-lead.md        # วางแผน แตกงาน ใช้ 4 skills
│   └── page-admin.md            # ร่างโพสต์/ตอบเพจ ทุกอย่างเป็นร่างก่อน
└── commands/
    ├── month-plan.md            # /month-plan
    ├── draft-post.md            # /draft-post
    └── weekly-review.md         # /weekly-review
```

## กติกาความปลอดภัย

- ทีมนี้เป็นระดับอำนาจ 2 เท่านั้น ไม่โพสต์เอง ไม่ส่งข้อความเอง ไม่ใช้เงิน
- `page-admin` ต้องได้คำยืนยันชัดเจนจากเจ้าของร้านในข้อความนั้นก่อนจะ publish หรือส่งคำตอบจริงทุกครั้ง
- ตัวเลขทุกตัวในรายงานต้องมาจากเครื่องมือ MCP จริง ห้ามเดา ข้อมูลไม่พอให้บอกว่า "ยังไม่รู้" ตรงๆ
