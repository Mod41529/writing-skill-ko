// typst compile template_a_academic.typ output.pdf
// 제목/저자/날짜는 파일 상단 변수로 설정

#let doc-title = "논문 제목을 입력하세요"
#let doc-authors = "홍길동, 김영희"
#let doc-affiliation = "소속 기관명"
#let doc-date = "2026-03-26"

#set page(
  paper: "a4",
  margin: (top: 20mm, bottom: 20mm, left: 18mm, right: 18mm),
  numbering: "1",
  footer: context align(center, text(size: 9pt, counter(page).display("1"))),
)

#set text(font: ("Noto Sans CJK KR", "Noto Sans CJK SC", "Noto Sans", "sans-serif"), size: 10pt)
#set par(leading: 1.4em, justify: true)

#show heading.where(level: 1): it => block(above: 1em, below: 0.45em)[
  #text(size: 11pt, weight: "bold")[
    #counter(heading).display("I.") #h(0.5em) #it.body
  ]
]

#align(center)[
  #text(size: 16pt, weight: "bold")[#doc-title]
  #v(0.6em)
  #text(size: 10pt)[#doc-authors]
  #linebreak()
  #text(size: 10pt)[#doc-affiliation]
  #linebreak()
  #text(size: 10pt, fill: rgb("#666666"))[#doc-date]
]

#v(0.9em)

#block(
  fill: rgb("#f5f5f5"),
  inset: (x: 8pt, y: 7pt),
  radius: 2pt,
)[
  #text(size: 9pt, style: "italic")[
    Abstract: 본 연구는 템플릿 기반 문서 작성 자동화의 구조와 품질 기준을 제시한다. 핵심 기여는 재현 가능한 레이아웃 규약과 작업 흐름 표준화에 있다.
  ]
]

#v(0.8em)

#columns(2, gutter: 5mm)[
  = 서론
  본문 내용을 입력하세요. 이 템플릿은 IEEE 스타일을 참고해 2단 컬럼과 밀도 높은 정보 전달을 중심으로 구성되었습니다.

  = 방법론
  연구 설계, 데이터 수집, 분석 절차를 기술하세요. 본문은 10pt, 줄간격 1.4로 설정되어 있습니다.

  = 결과 및 논의
  핵심 결과와 해석을 간결하게 제시하세요. 표와 그림을 삽입할 때는 가독성을 우선으로 배치합니다.

  = 참고문헌
  #set text(size: 9pt)
  + [1] 저자, "논문 제목," 학술지명, 권(호), pp. 1-10, 2026.
  + [2] 저자, _도서명_, 출판사, 2025.
  + [3] Author, "Article Title," Conference, pp. 100-110, 2024.
]
