// typst compile template_b_modern.typ output.pdf
// 제목/저자/날짜는 파일 상단 변수로 설정

#let doc-title = "기획서 제목을 입력하세요"
#let doc-date = "2026-03-26"

#let callout(body) = block(
  fill: rgb("#eef2ff"),
  inset: (x: 10pt, y: 8pt),
  stroke: (left: 2.25pt + rgb("#4a4a8a")),
  radius: 2pt,
)[#body]

#set page(
  paper: "a4",
  margin: (top: 20mm, bottom: 20mm, left: 25mm, right: 25mm),
  numbering: "1",
  header: context block(
    fill: rgb("#1a1a2e"),
    inset: (x: 10pt, y: 8pt),
  )[
    #set text(fill: white)
    #grid(
      columns: (1fr, auto),
      align: (left + horizon, right + horizon),
      [#text(size: 14pt, weight: "bold")[#doc-title]],
      [#text(size: 10pt)[#doc-date]],
    )
  ],
  footer: context align(right, text(size: 9pt, counter(page).display("1"))),
)

#set text(font: ("Noto Sans CJK KR", "Malgun Gothic", "NanumBarunGothic", "Noto Sans", "sans-serif"), size: 11pt)
#set par(leading: 1.6em, justify: true)

#show heading.where(level: 1): it => block(above: 1.1em, below: 0.55em)[
  #text(size: 14pt, weight: "bold", fill: rgb("#1a1a2e"))[#it.body]
  #line(length: 100%, stroke: 0.8pt + rgb("#1a1a2e"))
]

#show heading.where(level: 2): it => block(above: 0.9em, below: 0.4em)[
  #text(size: 12pt, weight: "bold", fill: rgb("#4a4a8a"))[#it.body]
]

= 프로젝트 개요
이 템플릿은 기획서와 보고서 문서에 맞춰 구조적 가독성과 시각적 강조를 함께 제공합니다.

== 배경
문제 정의, 현황 분석, 추진 배경을 서술하세요.

#callout[
핵심 메시지: 일정, 리소스, 우선순위를 한 문단 안에서 명확하게 요약하세요.
]

== 실행 계획
세부 실행 항목, 일정, 책임 범위를 항목별로 작성하세요.

= 기대 효과
정량 효과와 정성 효과를 분리해 기술하면 검토 속도가 빨라집니다.
