# aiya-marketing-team

ปลั๊กอิน Claude Cowork / Claude Code สำหรับทีมการตลาด AI ของร้านค้า AIYA
รวมเครื่องมือคิดการตลาด 10 ใบ (จากเพลย์บุ๊ก `positions/PLAYBOOK-mar-thinking-tools-20260910.md`)
+ ทีม agent 9 ตำแหน่งเดียวกับสมองกลางของ AIYA คุมโดย แนน (mkt_head) + connector 6 ตัว (เพจ/แอด/LINE/ทีมขาย/อีเวนต์/ท่อวางแผนอัตโนมัติ)

## สิ่งที่อยู่ในปลั๊กอิน

### Connectors (6 ตัว)

| ชื่อ | URL | ใช้ทำอะไร |
|---|---|---|
| `aiya-page` | `https://mcp.aiya.me/page` | ข้อมูลเพจ ร่าง/ตอบโพสต์ |
| `aiya-ads` | `https://mcp.aiya.me/ads` | อ่านแคมเปญ งบ ผลยิงแอด |
| `aiya-line` | `https://mcp.aiya.me/line` | ผู้ติดตามและข้อความ LINE OA |
| `aiya-sales` | `https://mcp.aiya.me/sales` | ข้อมูลทีมขาย/ออเดอร์ |
| `aiya-events` | `https://mcp.aiya.me/events` | ปฏิทินอีเวนต์/กิจกรรมร้าน |
| `aiya-agents` | `https://agents.aiya.me/mcp` | ท่อวางแผน-สร้างภาพ-ตรวจ-จัดคิวรายสัปดาห์ (`mkt_*`) และคู่มือแพลตฟอร์ม |

ทุกตัวเป็น HTTP + OAuth (ยังไม่ล็อกอินจะได้ 401) วิธีล็อกอินอยู่ใน `reference/onboarding.md`

## ท่อทีมการตลาด (weekly plan pipeline)

Connector `aiya-agents` เปิดทางให้ทีม AI ภายใน (แนน/มิ้นท์/กัน/ตาล) เดินท่อวางแผนสัปดาห์ต่อจากใบประกาศผลลัพธ์ที่เจ้าของประกาศไว้: `mkt_plan_propose` เสนอแผน → เจ้าของกด `mkt_plan_approve` เอง (P2 ห้ามกดแทน) → `mkt_creative_run` ดูคิวสร้างภาพ → `mkt_review_run` ตรวจร่างกับคำต้องห้าม/ราคาโปร/คำชวน → `mkt_handoff_run` ส่งร่างขึ้นปฏิทินเพจ → `mkt_queue_run` จัดคิวช่องเวลา จบที่ "รอเจ้าของกด" เสมอ ไม่มีขั้นไหนโพสต์ขึ้นเพจ/LINE จริงหรือใช้เงินจากในแชทได้เลย ดูรายละเอียดในสกิล `month-plan` และ `test-and-learn`

### Skills (10 ใบ)

| Skill | ไทย | ตอบคำถาม |
|---|---|---|
| `winning-zone` | จุดเด็ด | พูดอะไรให้คนจำ |
| `who-first` | ใครก่อน | คุยกับใครก่อน (RFM) |
| `leak` | รอยรั่ว | เงินรั่วตรงไหน (ฟันเนล 6 ขั้น) |
| `test-and-learn` | ลองแล้วรู้ | ดีขึ้นได้ยังไง |
| `month-plan` | แผนเดือน | เป้าธุรกิจ → ธีม → ปฏิทิน 4 สัปดาห์ → ช่องทาง → งบ |
| `brand-content` | คอนเทนต์ตามแบรนด์ | ร่างตามแบรนด์คิท/โทน/ข้อห้าม |
| `safe-ads` | ยิงแอดปลอดภัย | เตรียม → ยืนยัน → PAUSED + เพดานงบเสมอ |
| `weekly-review` | รีวิวสัปดาห์ | สรุป 3 ข้อภาษาคนจากตัวเลขจริง |
| `approval-gate` | เช็กก่อนอนุมัติ | อะไรต้องให้คนกดก่อน |
| `thai-calendar` | ปฏิทินไทย | เทศกาล/วันสำคัญ + เช็กลิสต์ก่อนเผยแพร่ |

### Agents (9 ตำแหน่ง)

ชื่อไฟล์ = id ตำแหน่งเดียวกับสมองกลางของ AIYA (ด่าน apps/api/test/plugin-agents-team.ts เฝ้าให้ตรงกัน)

- แนน (mkt_head) หัวหน้า แปลงใบประกาศผลลัพธ์เป็นแผนสัปดาห์ แล้วมอบงานต่อ
- วิว (mkt_research) วิจัยตลาดและผู้ฟัง จากแชทจริงของร้าน
- เฟิร์น (mkt_competitor) สืบคู่แข่งจากบันทึกที่คนของร้านกรอกไว้
- โบว์ (mkt_ads) แอดและผลลัพธ์ ผ่าน `aiya-ads` แบบ prepare/confirm
- ปลาย (mkt_content) เขียนคอนเทนต์ ร่าง 3 โทน ไม่โพสต์เอง
- มิ้นท์ (mkt_creative) ครีเอทีฟและภาพ บรีฟภาพ + สร้างภาพร่าง
- กัน (mkt_reviewer) ตรวจก่อนส่ง 3 ด่าน กันแต่งข้อมูล
- ตาล (mkt_scheduler) คิวและตารางโพสต์ หยิบเฉพาะชิ้นที่ตรวจผ่าน
- ฟ้า (mkt_report) รายงานผล ขึ้นต้นด้วยผลลัพธ์ที่ประกาศไว้

### Commands (10 คำสั่ง)

- `/month-plan` วางแผนเดือนผ่าน agent แนน (mkt_head)
- `/draft-post <หัวข้อ>` ร่างโพสต์ผ่าน agent ปลาย (mkt_content) (รอเจ้าของกดก่อนลงจริง)
- `/weekly-review` สรุปผลสัปดาห์เป็นภาษาคน 3 ข้อ จากตัวเลขจริงเท่านั้น
- `/calendar` วางปฏิทินเนื้อหาสัปดาห์/เดือน ผ่าน ปลาย (mkt_content) + มิ้นท์ (mkt_creative)
- `/ads` ดูผลแอดหรือตั้ง/ปรับงบแอดผ่าน โบว์ (mkt_ads)
- `/audience-rfm` แบ่งกองลูกค้า 5 กองผ่าน วิว (mkt_research)
- `/leak` หารอยรั่วฟันเนลแชทผ่าน วิว (mkt_research)
- `/experiment` ออกแบบ/อ่านผลการทดลอง A/B ผ่าน วิว (mkt_research)
- `/approvals` ดูคิวงานรออนุมัติผ่าน กัน (mkt_reviewer)
- `/owner-summary` สรุปสัปดาห์ให้เจ้าของร้านผ่าน แนน (mkt_head)

### Reference (4 ไฟล์)

- `reference/thai-ad-rules.md` ข้อห้ามโฆษณาไทย เครื่องสำอาง อาหารเสริม การเงิน (สรุปสั้น ไม่ใช่คำแนะนำกฎหมาย)
- `reference/metrics-benchmarks.md` นิยาม reach, CTR, cost per message, ฟันเนล 4 ขั้น และวิธีอ่าน
- `reference/credits-and-costs.md` เครดิตหักตามจริง ห้ามพูดว่า "ไม่จำกัด"
- `reference/onboarding.md` ต่อเพจ/LINE/แอดทีละขั้น

## ติดตั้ง

### Claude Cowork

1. เปิดหน้าตั้งค่า Plugin ของ Cowork
2. เพิ่ม marketplace จาก repo นี้: `megenius/aiya-plugins`
3. ติดตั้งปลั๊กอิน `aiya-marketing-team`

### Claude Code (CLI)

```
/plugin marketplace add megenius/aiya-plugins
/plugin install aiya-marketing-team@aiya
```

ชื่อ `aiya` มาจากชื่อ marketplace ใน `plugins/.claude-plugin/marketplace.json` ของ repo นี้
ถ้าเปลี่ยนชื่อ marketplace ในอนาคต ให้เช็คชื่อจริงจากไฟล์นั้นก่อนสั่งติดตั้ง

## วิธีล็อกอิน connector

ปลั๊กอินนี้ต่อกับ AIYA ผ่าน remote MCP ทุกตัวต้องล็อกอินแบบ OAuth ครั้งแรกก่อนใช้ แยกกันคนละ connector

1. หลังติดตั้ง เปิดหน้าจัดการ MCP connector ของ Claude (ใน Claude Code ใช้ `/mcp`)
2. เลือก connector ที่จะใช้ กด login/authorize ด้วยบัญชี AIYA ของร้าน
3. ยืนยันสิทธิ์ (scope) ที่ขอ แล้วกลับมาที่ Claude เมื่อเห็นสถานะ connected แปลว่าใช้งานได้

ถ้า connector ขึ้นว่าไม่ต่อติดหรือหมดอายุ ให้ login ใหม่ผ่านขั้นตอนเดียวกัน agent ปลาย (mkt_content) และ โบว์ (mkt_ads)
จะบอกตรงๆ เมื่อเรียกเครื่องมือแล้วเจอปัญหานี้ ไม่แกล้งทำว่าทำงานสำเร็จ
ขั้นตอนต่อเพจ/LINE/แอดทีละขั้นอยู่ใน `reference/onboarding.md`

## เดโม 3 ขั้น

1. **วางแผนเดือน** พิมพ์ `/month-plan` ระบบจะเรียก agent แนน (mkt_head) ใช้เครื่องมือคิด 4 ใบ
   (จุดเด็ด → ใครก่อน → รอยรั่ว → ลองแล้วรู้) แล้วสรุปเป็นแผน 1 เดือน
2. **ร่างโพสต์** พิมพ์ `/draft-post <หัวข้อ>` ระบบจะเรียก agent ปลาย (mkt_content) ร่างโพสต์ตามจุดขายและเสียงแบรนด์ร้าน
   เช็กข้อห้ามโฆษณากับ `reference/thai-ad-rules.md` แสดงร่างให้ดูก่อนเสมอ **ไม่ publish จนกว่าจะพิมพ์ยืนยัน**
3. **ดูผลสัปดาห์** พิมพ์ `/weekly-review` ระบบจะสรุปผลสัปดาห์นี้เป็นภาษาคน 3 ข้อ จากตัวเลขจริงเท่านั้น
   อ่านตัวเลขด้วยนิยามใน `reference/metrics-benchmarks.md`

## แพ็กเกจ 3 ระดับ (โมเดล one person business ไม่รวมราคา)

ระดับต่างๆ ต่างกันที่ "ทีม AI ทำแทนได้กี่ขั้น" ไม่ใช่ตัวเลขราคา ราคาและโปรโดยฝ่ายขายเสนอเท่านั้น

| | เลขาฟรี | ทีมพื้นฐาน | ทีมเต็ม |
|---|---|---|---|
| ใครใช้ | เจ้าของร้านคนเดียว | มีคนช่วย 1-2 คน | ทีมการตลาดเต็มตัว |
| Connector | `aiya-page` | + `aiya-line` `aiya-events` | ครบทั้ง 5 ตัว (รวม `aiya-ads` `aiya-sales`) |
| Skills | 4 ใบ (คิดเองตามเพลย์บุ๊ก) | 4 ใบ + ตั้งเวลารีวิวอัตโนมัติ | 4 ใบ + วางแผน/รีวิว/ทดลองแคมเปญ |
| Agents | ใช้เป็นที่ปรึกษา ไม่มี agent ประจำ | แนน (mkt_head) | ครบทั้ง 9 ตำแหน่ง |
| การ publish | เจ้าของคิดเอง เขียนเอง | ร่างให้ เจ้าของตัดสินใจทุกชิ้น | ร่าง+เช็กกติกาโฆษณาให้ เจ้าของกดยืนยันทุกชิ้น |

หลักเดียวกันทุกระดับ: AI ร่างได้แต่ห้าม publish ห้ามส่ง ห้ามใช้เงินโดยไม่มีคนกดยืนยัน

## คำสั่งเพิ่มเติม

| คำสั่ง | ใช้เมื่อ | agent/skill ที่ผูก |
|---|---|---|
| `/calendar` | วางปฏิทินเนื้อหาสัปดาห์/เดือน | ปลาย (mkt_content) + มิ้นท์ (mkt_creative) |
| `/ads` | ดูผลแอดหรือตั้ง/ปรับงบแอด | โบว์ (mkt_ads) (connector `aiya-ads` แบบ prepare/confirm) |
| `/audience-rfm` | แบ่งกองลูกค้า 5 กอง | วิว (mkt_research) เรียก skill **ใครก่อน** |
| `/leak` | หารอยรั่วฟันเนลแชท | วิว (mkt_research) เรียก skill **รอยรั่ว** |
| `/experiment` | ออกแบบ/อ่านผลการทดลอง A/B | วิว (mkt_research) เรียก skill **ลองแล้วรู้** |
| `/approvals` | ดูคิวงานรออนุมัติ | กัน (mkt_reviewer) |
| `/owner-summary` | สรุปสัปดาห์ให้เจ้าของร้าน | แนน (mkt_head) คุม วิว (mkt_research) + กัน (mkt_reviewer) |

## โครงสร้าง

```
aiya-marketing-team/
├── .claude-plugin/plugin.json
├── .mcp.json                    # connector 6 ตัว (page, ads, line, sales, events, agents)
├── reference/
│   ├── thai-ad-rules.md         # ข้อห้ามโฆษณาไทย (สรุปสั้น)
│   ├── metrics-benchmarks.md    # นิยามตัวชี้วัดและวิธีอ่าน
│   ├── credits-and-costs.md     # เครดิตหักตามจริง
│   └── onboarding.md            # ต่อเพจ/LINE/แอดทีละขั้น
├── skills/
│   ├── winning-zone/SKILL.md    # จุดเด็ด - พูดอะไร
│   ├── who-first/SKILL.md       # ใครก่อน - พูดกับใคร (RFM)
│   ├── leak/SKILL.md            # รอยรั่ว - เงินรั่วตรงไหน
│   ├── test-and-learn/SKILL.md  # ลองแล้วรู้ - ดีขึ้นได้ยังไง
│   ├── month-plan/SKILL.md      # เป้าธุรกิจ → ธีม → ปฏิทิน 4 สัปดาห์ → ช่องทาง → งบ
│   ├── brand-content/SKILL.md   # ร่างตามแบรนด์คิท/โทน/ข้อห้าม
│   ├── safe-ads/SKILL.md        # เตรียม → ยืนยัน → ไปกดจริงที่ /ads เสมอ PAUSED + เพดานงบ
│   ├── weekly-review/SKILL.md   # ตัวเลขจริงเทียบสัปดาห์ก่อน สรุป 3 ข้อภาษาคน
│   ├── approval-gate/SKILL.md   # เช็กลิสต์: อะไรต้องให้คนกดก่อน
│   └── thai-calendar/SKILL.md   # เทศกาล/วันสำคัญไทย + เช็กลิสต์ก่อนเผยแพร่
├── agents/
│   ├── mkt_head.md              # แนน หัวหน้า วางแผนสัปดาห์ แตกงาน มอบงาน
│   ├── mkt_research.md          # วิว วิจัยตลาดและผู้ฟัง จากแชทจริง
│   ├── mkt_competitor.md        # เฟิร์น สืบคู่แข่งจากบันทึกของร้าน
│   ├── mkt_ads.md               # โบว์ แอดและผลลัพธ์ แบบ prepare/confirm
│   ├── mkt_content.md           # ปลาย เขียนคอนเทนต์ ร่าง 3 โทน
│   ├── mkt_creative.md          # มิ้นท์ ครีเอทีฟและภาพ
│   ├── mkt_reviewer.md          # กัน ตรวจก่อนส่ง 3 ด่าน
│   ├── mkt_scheduler.md         # ตาล คิวและตารางโพสต์
│   └── mkt_report.md            # ฟ้า รายงานผลเข้าเจ้าของ
└── commands/
    ├── month-plan.md            # /month-plan
    ├── draft-post.md            # /draft-post
    ├── weekly-review.md         # /weekly-review
    ├── calendar.md              # /calendar
    ├── ads.md                   # /ads
    ├── audience-rfm.md          # /audience-rfm
    ├── leak.md                  # /leak
    ├── experiment.md            # /experiment
    ├── approvals.md             # /approvals
    └── owner-summary.md         # /owner-summary
```

## กติกาความปลอดภัย

- ทีมนี้เป็นระดับอำนาจ 2 เท่านั้น ไม่โพสต์เอง ไม่ส่งข้อความเอง ไม่ใช้เงิน
- ปลาย (mkt_content) ร่างอย่างเดียว การลงจริงต้องให้เจ้าของกดเองในระบบ ตาล (mkt_scheduler) ได้แค่จองเวลาเข้าคิว
- โบว์ (mkt_ads) ต้องผ่านขั้นเตรียม (prepare) ก่อนเสมอ และต้องได้คำยืนยันชัดเจนก่อนเรียกขั้นยืนยัน (confirm) ที่ใช้เงินจริง
- กัน (mkt_reviewer) ให้ความเห็นก่อนอนุมัติเท่านั้น ไม่ใช่ผู้อนุมัติ และไม่แก้ร่างเอง
- ตัวเลขทุกตัวในรายงานต้องมาจากเครื่องมือ MCP จริง ห้ามเดา ข้อมูลไม่พอให้บอกว่า "ยังไม่รู้" ตรงๆ
- โฆษณาทุกชิ้นเช็กข้อห้ามกับ `reference/thai-ad-rules.md` ก่อนขอยืนยัน publish
- ห้ามสัญญาเรื่องราคา โปรโมชั่น หรือตัวเลขผลลัพธ์ที่ไม่มีข้อมูลจริงรองรับ
