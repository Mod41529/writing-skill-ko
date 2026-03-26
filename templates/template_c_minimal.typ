// typst compile template_c_minimal.typ output.pdf
// 제목/저자/날짜는 파일 상단 변수로 설정

#let doc-title = "제목을 입력하세요"
#let doc-subtitle = "부제를 입력하세요"
#let doc-author = "저자명"
#let doc-date = "2026-03-26"

#set page(
  paper: "a4",
  margin: (top: 25mm, bottom: 25mm, left: 35mm, right: 35mm),
  numbering: "1",
  footer: context align(center, text(size: 10pt, counter(page).display("1"))),
)

#set text(
  font: ("NanumMyeongjo", "HCR Batang", "Noto Serif CJK KR", "Noto Serif CJK SC", "serif"),
  size: 11pt,
)

#set par(
  leading: 1.8em,
  first-line-indent: 0em,
  spacing: 0.8em,
  justify: true,
)

#show heading: none

#align(center)[
  #text(size: 20pt, weight: "bold")[#doc-title]
  #v(0.6em)
  #text(size: 13pt, style: "italic")[#doc-subtitle]
]

#v(1.2em)

#align(right)[
  #text(size: 10pt, fill: rgb("#666666"))[#doc-author]
  #linebreak()
  #text(size: 10pt, fill: rgb("#666666"))[#doc-date]
]

#v(1.4em)

첫 문단을 입력하세요. 이 템플릿은 에세이, 소설, 브런치 스타일 글을 위해 넓은 여백과 절제된 타이포그래피를 제공합니다.

문단 사이에는 0.8em 간격이 적용되고, 문단 들여쓰기는 비활성화되어 있습니다. 긴 호흡의 문장을 담담하게 배치할 때 적합합니다.
