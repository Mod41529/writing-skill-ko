# writing-skill-ko

A Claude Code slash command for natural Korean writing — anti-AI ruleset, 7 author style profiles with DNA analysis, audience targeting, series intelligence.

![Claude Code](https://img.shields.io/badge/Claude%20Code-slash%20command-blueviolet)
![Language](https://img.shields.io/badge/language-Korean%20focused-green)
![License](https://img.shields.io/badge/license-MIT-blue)

---

## 📸 Screenshots

![Interactive Menu](screenshots/1-menu.png)
*Genre selection, author style, output format*

![Outline](screenshots/2-outline.png)
*Structured outline with section breakdown*

![Verification](screenshots/4-verification.png)
*Character count via `wc -m`, style checklist, spellcheck*

---

## ✨ Features

- **Interactive intake** — AskUserQuestion-based UX, no wall-of-text menus
- **7 author style profiles** with DNA tables (luma · 이외수 · 한강 · 하루키 · 롤링 · 유시민 · 김훈)
- **Style DNA analysis** — sentence rhythm, ending diversity, hanja density measured via python3/bash
- **Audience targeting** — MZ직장인 / 인문독자 / 창업자 / 일반대중 auto-adjusts vocabulary & tone
- **Anti-AI ruleset** — 11 forbidden patterns (translation-isms, filler connectors, repeated endings, etc.)
- **Auto verification** — every draft gets character count, DNA check, spellcheck (no flag needed)
- **Platform calibration** — DNA thresholds adjust for newsletter/SNS short-form formats
- **Series intelligence** — plot thread tracking, episode log, arc timeline, continuity checks
- **Pass 3 spellcheck** — grep detection + sed auto-correction, no external API
- **Output formats** — Markdown / Word (pandoc) / PDF (Typst, 4 templates included)
- **Standalone** — no vault, no external API dependency

---

## 🚀 Installation

```bash
# Basic install (skill only)
curl -o ~/.claude/commands/writing.md \
  https://raw.githubusercontent.com/Mod41529/writing-skill-ko/main/writing.md

# Full install (skill + Typst PDF templates)
git clone https://github.com/Mod41529/writing-skill-ko.git
cp writing-skill-ko/writing.md ~/.claude/commands/
mkdir -p ~/.claude/writing-templates
cp writing-skill-ko/templates/* ~/.claude/writing-templates/
```

> Typst templates require [Typst](https://typst.app/) to be installed.
> `winget install --id Typst.Typst` / `brew install typst` / `cargo install typst-cli`

---

## 📖 Usage

```bash
# Interactive mode — AskUserQuestion guided session
/writing

# Specify style
/writing essay "AI와 일자리" --style 유시민

# Series mode — plot threads, episode log, arc timeline
/writing fiction "우주비행사 이야기" --series 궤도

# Polish mode — paste your text and fix it
/writing --polish

# Polish with style transformation
/writing --polish --style 김훈
```

---

## 🖊️ Author Style Profiles

| Style | Key Trait | Best For |
|---|---|---|
| **luma** | 솔직담백, 건조하되 감각적, 감정 절제 | 에세이, 브런치 |
| **이외수** | 파격적 비유 + 어록형 단문, 독설적 유머 | 소설, 칼럼 |
| **한강** | 감각 파편화, 몸의 언어, 시적 리듬 | 소설, 시적 에세이 |
| **하루키** | 담담한 1인칭, 고유명사(음악·음식), 열린 결말 | 에세이, 단편 |
| **롤링** | 밀착 3인칭+자유간접화법, 챕터 클리프행어 | 소설, 장편 |
| **유시민** | 논증 구조, 독자 질문, 지적 유머 | 칼럼, 논설 |
| **김훈** | 단문 명사 종결, 역사·전쟁·자연, 한자어 밀도 | 소설, 역사 에세이 |

---

## 🚫 Anti-AI Ruleset (Excerpt)

| Pattern | Example | Rule |
|---|---|---|
| 번역투 | ~에 대한, ~를 통한, ~에 있어서 | 금지 |
| 어미 반복 | ~다/~다/~다 연속 3문장 | 변주 필수 |
| 접속사 과용 | 또한/하지만/그러나 | 문장 구조로 연결 |
| 감정 직접 서술 | "매우 슬펐다", "정말 감동적이었다" | 상황·감각으로 대체 |
| 상투적 서론 | "오늘날~시대에", "최근 들어" | 금지 |

---

## ✅ Auto Verification (runs every draft)

Every draft automatically gets the full verification pipeline — no `--verify` flag needed.

### Character Count (6-1)
```bash
echo '본문 텍스트' | tr -d '[:space:]' | wc -m
```
Whitespace-excluded measurement + ±20% correction loop (±15% for newsletter/brunch).

### Style DNA Analysis (6-5)
Three python3 scripts measure sentence-level metrics and compare against author DNA tables:

```
📊 문체 검증 결과
├─ 분량: 2,341자 ✓
├─ 문장 리듬: 평균 18자 | 단55% 중35% 장10% → 김훈 기대값 ✓
├─ 어미 다양성: 0.28 (김훈 ≤0.3 ✓)
├─ 한자어 밀도: 12건 (김훈 10+ ✓)
├─ grep 지표: 역사·전쟁어 5건 ✓
└─ 독자 적합성(MZ직장인): 한자어 밀도 낮음 ✓
```

**Platform calibration:** newsletter DNA thresholds are 70% of standard (shorter sentences are natural). SNS skips sentence-length checks entirely.

### grep Indicators (7 categories)

| Indicator | Expected high in |
|---|---|
| 분석어 (경제/비용/구조/논리) | 유시민 |
| 감각어 (빛/냄새/온도/촉각) | 한강, luma |
| 비유·의인법 (처럼/듯/마치) | 이외수 |
| 고유명사 (재즈/파스타/에스프레소) | 하루키 |
| 독자 질문·권유 (아닐까/따져보) | 유시민 |
| 열린 결말어 (모르겠다/아직/글쎄) | 하루키, luma |
| 역사·전쟁어 (전쟁/칼/도강/패퇴) | 김훈 |

---

## 🎯 Audience Targeting

Automatically detected from conversation or selected via intake menu:

| Profile | Vocabulary | Tone | Best For |
|---|---|---|---|
| **MZ직장인** | 일상어+인터넷어 | 공감형, 짧은 호흡 | 에세이, SNS |
| **인문독자** | 문학어+한자어 | 여백과 여운, 긴 호흡 허용 | 에세이, 소설 |
| **창업자** | 실용어+수치 | 인사이트 먼저, takeaway 필수 | 에세이, 카피 |
| **일반대중** | 쉬운 일상어 | 짧은 문단, 보편 비유 | 전체 |

---

## 📚 Series Intelligence

`--series` creates a local file structure for multi-episode writing:

```
~/.claude/writing-series/{시리즈명}/
├── context.md       — world, characters, tone
├── episode_log.md   — 5-line summary per episode
├── plot_threads.md  — unresolved foreshadowing tracker
└── arc.md           — episode arc timeline table
```

- **Auto-loads** previous 2 episodes + unresolved plot threads on new episode start
- **Auto-updates** all files after each episode completion
- **Continuity checks** — character name consistency, setting conflicts, 3+ episode unresolved thread warnings

---

## ⚙️ Options

| Option | Description |
|---|---|
| `--outline` | Generate structure first, then draft |
| `--draft` | Skip to draft immediately |
| `--polish` | Fix pasted text (preserve meaning, fix style) |
| `--style {name}` | Set author style (luma / 이외수 / 한강 / 하루키 / 롤링 / 유시민 / 김훈) |
| `--polish --style` | Transform pasted text to specified author's style |
| `--series {name}` | Series mode with plot tracking, episode log, arc timeline |
| `--save` | Save output to `~/writing-output/{genre}/` |
| `--output {format}` | md (default) / brunch / word / pdf |
| `--brief` | Suppress process output, result only |

> Note: Style verification runs automatically on every draft. No `--verify` flag needed.

---

## 📄 License

MIT

---

## 👤 Author

[luma](https://github.com/Mod41529)
