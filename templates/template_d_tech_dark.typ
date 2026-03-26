// typst compile template_d_tech_dark.typ output.pdf
// 제목/저자/날짜는 파일 상단 변수로 설정

#let doc-title = "기술 문서 제목을 입력하세요"
#let doc-date = "2026-03-26"

#let caution(body) = block(
  fill: rgb("#fff8c5"),
  inset: (x: 10pt, y: 8pt),
  radius: 2pt,
)[#body]

#let tip(body) = block(
  fill: rgb("#d1fae5"),
  inset: (x: 10pt, y: 8pt),
  radius: 2pt,
)[#body]

#set page(
  paper: "a4",
  margin: (top: 20mm, bottom: 20mm, left: 22mm, right: 22mm),
  numbering: "1",
  header: context block(
    fill: rgb("#0d1117"),
    inset: (x: 10pt, y: 8pt),
  )[
    #set text(fill: white)
    #grid(
      columns: (1fr, auto),
      [#text(size: 12pt, weight: "bold")[#doc-title]],
      [#text(size: 10pt)[#doc-date]],
    )
  ],
  footer: context align(
    right,
    text(size: 9pt, fill: rgb("#8b949e"), counter(page).display("1")),
  ),
)

#set text(font: ("Noto Sans CJK KR", "Noto Sans CJK SC", "Noto Sans", "sans-serif"), size: 10.5pt)
#set par(leading: 1.5em, justify: true)

#show heading.where(level: 1): it => block(above: 1.1em, below: 0.55em)[
  #text(size: 16pt, weight: "bold")[#it.body]
  #line(length: 100%, stroke: 0.8pt + rgb("#30363d"))
]

#show heading.where(level: 2): it => block(above: 0.95em, below: 0.45em)[
  #text(size: 13pt, weight: "bold", fill: rgb("#58a6ff"))[#it.body]
]

#show heading.where(level: 3): it => block(above: 0.8em, below: 0.35em)[
  #text(size: 11pt, weight: "bold", fill: rgb("#8b949e"))[#it.body]
]

#show raw.where(block: true): it => block(
  fill: rgb("#161b22"),
  inset: 8pt,
  radius: 2pt,
)[
  #set text(font: ("Cascadia Mono", "Consolas", "Noto Sans Mono CJK KR", "monospace"), size: 9pt, fill: white)
  #it
]

#show raw.where(block: false): it => box(
  fill: rgb("#21262d"),
  inset: (x: 4pt, y: 1.5pt),
  radius: 1.5pt,
)[
  #set text(font: ("Cascadia Mono", "Consolas", "Noto Sans Mono CJK KR", "monospace"), size: 9pt, fill: rgb("#f0883e"))
  #it
]

= 빠른 시작
기술 문서, README, 튜토리얼에 맞춘 템플릿입니다.

== 설치
아래 명령으로 프로젝트 의존성을 설치합니다.

```bash
typst compile template_d_tech_dark.typ output.pdf
```

#caution[
주의: 환경마다 폰트 가용성이 다르므로 CJK 계열 폰트가 없으면 기본 sans-serif로 대체될 수 있습니다.
]

== 작성 팁
`typst compile` 같은 인라인 코드는 강조된 배경과 주황색 텍스트로 표시됩니다.

#tip[
팁: 섹션을 짧게 분할하고 코드 예시를 함께 배치하면 튜토리얼 이해도가 높아집니다.
]
