// Build: typst compile --font-path fonts resume.typ   (or: make resume)

#let accent = rgb("#1a1a1a")
#let muted = rgb("#555555")
#let rule = 0.55pt + accent
#let section-gap = 1.4em

#set page(margin: 0.5in)
#set text(font: "Lora", size: 9.5pt, fill: accent)
#set par(leading: 0.84em, spacing: 0.55em)
#show heading: none
#show list: set block(above: 0.12em, below: 0.1em)
#show list.item: set block(spacing: 0.42em)
#set list(
  indent: 0.85em,
  body-indent: 0.35em,
)

#show link: it => {
  set text(fill: muted)
  underline(none)
  it
}

#let serif = "Lora"
#let contact-sep = [#h(0.1em)#text(fill: accent)[·]#h(0.1em)]

#let section-header(title) = {
  text(font: serif, size: 10.5pt, weight: "medium")[#title]
  v(0.14em)
  line(length: 100%, stroke: rule)
  v(0.22em)
}

#let resume-section(title, body) = block(below: section-gap)[
  #section-header(title)
  #body
]

#let entry(title, dates, body: none, top: 0.95em) = {
  v(top)
  grid(
    columns: (1fr, auto),
    align: (left, right),
    gutter: 0.8em,
    text(weight: "semibold")[#title],
    text(size: 9pt, fill: muted)[#dates],
  )
  if body != none {
    v(0.6em)
    body
  }
}

#let skill-row(label, items) = grid(
  columns: (5.4em, 1fr),
  column-gutter: 0.6em,
  text(weight: "semibold", size: 9.5pt)[#label],
  items,
)

#let honor(title, dates, detail: none) = {
  grid(
    columns: (1fr, auto),
    align: (left, right),
    gutter: 0.8em,
    [
      #text(weight: "semibold")[#title]
      #if detail != none [
        #h(0.35em)
        #text(size: 9.5pt, fill: muted)[#detail]
      ]
    ],
    text(size: 9pt, fill: muted)[#dates],
  )
  v(0.22em)
}

#align(center)[
  #text(font: serif, size: 21pt, weight: "regular", tracking: -0.01em)[Marco Yang]
  #v(0.32em)
  #set text(size: 9pt, fill: muted)
  510-738-8001
  #contact-sep
  #link("mailto:myang2@caltech.edu")[myang2\@caltech.edu]
  #contact-sep
  #link("https://linkedin.com/in/marco-yang-17189a203")[linkedin/marco-yang-17189a203]
  #contact-sep
  #link("https://github.com/mcrco")[github/mcrco]
  #contact-sep
  #link("https://marcoya.ng")[marcoya.ng]
]

#v(0.3em)

#resume-section[education][
  #grid(
    columns: (1fr, auto),
    align: (left, right),
    gutter: 0.8em,
    text(weight: "semibold")[California Institute of Technology],
    text(size: 9pt, fill: muted)[Mar 2027],
  )
  #v(0.05em)
  #text(size: 9.5pt, fill: muted)[B.S. Computer Science · GPA 3.91 · Pasadena, CA]
]

#resume-section[skills][
  #skill-row[Languages][C, C++, Java, Go, Python, TypeScript]
  #v(0.24em)
  #skill-row[ML & AI][PyTorch, Agentic Frameworks, Computer Vision, Generative AI, Reinforcement Learning]
  #v(0.24em)
  #skill-row[Systems][CUDA, Linux, Git, Shell]
]

#resume-section[experience][
  #entry(
    [Member of Technical Staff Intern · Parallel Web Systems],
    [Sep 2026 -- Dec 2026],
    top: 0em,
    body: [
      - Incoming, building search infrastructure for agents.
    ],
  )

  #entry(
    [Software Engineering Intern · Two Sigma],
    [Jun 2026 -- Aug 2026],
    body: [
      - Related to simulations.
    ],
  )

  #entry(
    [Software Engineer Intern · Glean],
    [Jun 2025 -- Sep 2025],
    body: [
      - AI Team at enterprise search and assistant startup.
      - Built and deployed LLM-as-a-judge evaluations and automated evalset pipelines for agents.
      - Shipped automated prompt optimization for Glean Agent Builder.
      - Misc. features and bug fixes in Go agent backend.
    ],
  )

  #entry(
    [Teaching Assistant · Intro to Software Design in C],
    [Spring 2025],
    body: [
      - Guided projects building a physics engine with collision and SDL graphics, and video game.
    ],
  )

  #entry(
    [Summer Undergraduate Research Fellow · Caltech Vision (Perona) Lab],
    [Jun 2024 -- Aug 2024],
    body: [
      - Cross-domain video action recognition with generative diffusion models.
      - Extracted cross-attention maps from UNet in Stable Diffusion and Modelscope.
      - Implemented LSTM, 3D CNN, Transformer classification heads on top of diffusion features.
    ],
  )
]

#resume-section[projects][
  #entry(
    [CUDA Qwen3.5 Inference],
    [github],
    top: 0em,
    body: [
      - CUDA autoregressive inference engine for Qwen3.5 with single-token prediction.
      - Flash attention and Gated DeltaNet linear-attention kernels.
    ],
  )

  #entry(
    [Catan RL Bot],
    [github],
    body: [
      - RL bot for Settlers of Catan trained with DAgger, PPO, and AlphaZero (WIP).
      - ~70% win rate vs Catanatron baseline bots.
    ],
  )

  #entry(
    [Caltech RAG],
    [github · demo archived],
    body: [
      - LLM RAG app as unified interface for Caltech course reviews and catalogs.
      - Flask, LangChain, LangGraph, Qdrant.
    ],
  )
]

#resume-section[relevant coursework][
  #text(size: 9.5pt)[
    Data Structures, Algorithms, Advanced Machine Learning, Large Language and Vision Models, GPU Programming, Computing Systems, Networks, Relational Databases, Applied Linear Algebra, Statistical Inference, Information Theory
  ]
]

#resume-section[honors & accolades][
  #honor([William Lowell Putnam], [Dec 2023], detail: [Top 1000 · 19 pts])
  #honor([USACO], [Feb 2021], detail: [Gold Division])
  #honor([AMC / AIME], [Nov 2021], detail: [3× qualifier])
]

#resume-section[fun facts][
  #v(0.28em)
  #text(size: 9.5pt)[
    Caltech tennis team member. Formerly assistant program director for ACEing Autism (Caltech branch). Biked from Denver to NYC.
  ]
]
