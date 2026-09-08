
#import "@preview/fontawesome:0.5.0": fa-icon

#let name = "Chandan"
#let locale-catalog-page-numbering-style = context { "Chandan - Page " + str(here().page()) + " of " + str(counter(page).final().first()) + "" }
#let locale-catalog-last-updated-date-style = "Last updated in Mar 2026"
#let locale-catalog-language = "en"
#let design-page-size = "us-letter"
#let design-colors-text = rgb(0, 0, 0)
#let design-colors-section-titles = rgb(0, 79, 144)
#let design-colors-last-updated-date-and-page-numbering = rgb(128, 128, 128)
#let design-colors-name = rgb(0, 79, 144)
#let design-colors-connections = rgb(0, 79, 144)
#let design-colors-links = rgb(0, 79, 144)
#let design-section-titles-font-family = "Source Sans 3"
#let design-section-titles-bold = true
#let design-section-titles-line-thickness = 0.5pt
#let design-section-titles-font-size = 1.4em
#let design-section-titles-type = "with-partial-line"
#let design-section-titles-vertical-space-above = 0.5cm
#let design-section-titles-vertical-space-below = 0.3cm
#let design-section-titles-small-caps = false
#let design-links-use-external-link-icon = true
#let design-text-font-size = 10pt
#let design-text-leading = 0.6em
#let design-text-font-family = "Source Sans 3"
#let design-text-alignment = "justified"
#let design-text-date-and-location-column-alignment = right
#let design-header-photo-width = 3.5cm
#let design-header-use-icons-for-connections = true
#let design-header-name-font-family = "Source Sans 3"
#let design-header-name-font-size = 30pt
#let design-header-name-bold = true
#let design-header-small-caps-for-name = false
#let design-header-connections-font-family = "Source Sans 3"
#let design-header-vertical-space-between-name-and-connections = 0.7cm
#let design-header-vertical-space-between-connections-and-first-section = 0.7cm
#let design-header-use-icons-for-connections = true
#let design-header-horizontal-space-between-connections = 0.5cm
#let design-header-separator-between-connections = ""
#let design-header-alignment = center
#let design-highlights-summary-left-margin = 0cm
#let design-highlights-bullet = "•"
#let design-highlights-nested-bullet = "-"
#let design-highlights-top-margin = 0.25cm
#let design-highlights-left-margin = 0.4cm
#let design-highlights-vertical-space-between-highlights = 0.25cm
#let design-highlights-horizontal-space-between-bullet-and-highlights = 0.5em
#let design-entries-vertical-space-between-entries = 1.2em
#let design-entries-date-and-location-width = 4.15cm
#let design-entries-allow-page-break-in-entries = true
#let design-entries-horizontal-space-between-columns = 0.1cm
#let design-entries-left-and-right-margin = 0.2cm
#let design-page-top-margin = 2cm
#let design-page-bottom-margin = 2cm
#let design-page-left-margin = 2cm
#let design-page-right-margin = 2cm
#let design-page-show-last-updated-date = true
#let design-page-show-page-numbering = true
#let design-links-underline = false
#let design-entry-types-education-entry-degree-column-width = 1cm
#let date = datetime.today()

// Metadata:
#set document(author: name, title: name + "'s CV", date: date)

// Page settings:
#set page(
  margin: (
    top: design-page-top-margin,
    bottom: design-page-bottom-margin,
    left: design-page-left-margin,
    right: design-page-right-margin,
  ),
  paper: design-page-size,
  footer: if design-page-show-page-numbering {
    text(
      fill: design-colors-last-updated-date-and-page-numbering,
      align(center, [_#locale-catalog-page-numbering-style _]),
      size: 0.9em,
    )
  } else {
    none
  },
  footer-descent: 0% - 0.3em + design-page-bottom-margin / 2,
)
// Text settings:
#let justify
#let hyphenate
#if design-text-alignment == "justified" {
  justify = true
  hyphenate = true
} else if design-text-alignment == "left" {
  justify = false
  hyphenate = false
} else if design-text-alignment == "justified-with-no-hyphenation" {
  justify = true
  hyphenate = false
}
#set text(
  font: design-text-font-family,
  size: design-text-font-size,
  lang: locale-catalog-language,
  hyphenate: hyphenate,
  fill: design-colors-text,
  // Disable ligatures for better ATS compatibility:
  ligatures: true,
)
#set par(
  spacing: 0pt,
  leading: design-text-leading,
  justify: justify,
)
#set enum(
  spacing: design-entries-vertical-space-between-entries,
)

// Highlights settings:
#let highlights(..content) = {
  list(
    ..content,
    marker: design-highlights-bullet,
    spacing: design-highlights-vertical-space-between-highlights,
    indent: design-highlights-left-margin,
    body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
  )
}
#show list: set list(
  marker: design-highlights-nested-bullet,
  spacing: design-highlights-vertical-space-between-highlights,
  indent: 0pt,
  body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
)

// Entry utilities:
#let bullet-entry(..content) = {
  list(
    ..content,
    marker: design-highlights-bullet,
    spacing: 0pt,
    indent: 0pt,
    body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
  )
}
#let three-col(
  left-column-width: 1fr,
  middle-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (auto, auto, auto),
) = [
  #block(
    grid(
      columns: (left-column-width, middle-column-width, right-column-width),
      column-gutter: design-entries-horizontal-space-between-columns,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #middle-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

#let two-col(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, auto),
  column-gutter: design-entries-horizontal-space-between-columns,
) = [
  #block(
    grid(
      columns: (left-column-width, right-column-width),
      column-gutter: column-gutter,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

// Main heading settings:
#let header-font-weight
#if design-header-name-bold {
  header-font-weight = 700
} else {
  header-font-weight = 400
}
#show heading.where(level: 1): it => [
  #set par(spacing: 0pt)
  #set align(design-header-alignment)
  #set text(
    font: design-header-name-font-family,
    weight: header-font-weight,
    size: design-header-name-font-size,
    fill: design-colors-name,
  )
  #if design-header-small-caps-for-name [
    #smallcaps(it.body)
  ] else [
    #it.body
  ]
  // Vertical space after the name
  #v(design-header-vertical-space-between-name-and-connections)
]

#let section-title-font-weight
#if design-section-titles-bold {
  section-title-font-weight = 700
} else {
  section-title-font-weight = 400
}

#show heading.where(level: 2): it => [
  #set align(left)
  #set text(size: (1em / 1.2)) // reset
  #set text(
    font: design-section-titles-font-family,
    size: (design-section-titles-font-size),
    weight: section-title-font-weight,
    fill: design-colors-section-titles,
  )
  #let section-title = (
    if design-section-titles-small-caps [
      #smallcaps(it.body)
    ] else [
      #it.body
    ]
  )
  // Vertical space above the section title
  #v(design-section-titles-vertical-space-above, weak: true)
  #block(
    breakable: false,
    width: 100%,
    [
      #if design-section-titles-type == "moderncv" [
        #two-col(
          alignments: (right, left),
          left-column-width: design-entries-date-and-location-width,
          right-column-width: 1fr,
          left-content: [
            #align(horizon, box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles))
          ],
          right-content: [
            #section-title
          ]
        )

      ] else [
        #box(
          [
            #section-title
            #if design-section-titles-type == "with-partial-line" [
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ] else if design-section-titles-type == "with-full-line" [

              #v(design-text-font-size * 0.4)
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ]
          ]
        )
      ]
     ] + v(1em),
  )
  #v(-1em)
  // Vertical space after the section title
  #v(design-section-titles-vertical-space-below - 0.5em)
]

// Links:
#let original-link = link
#let link(url, body) = {
  body = [#if design-links-underline [#underline(body)] else [#body]]
  body = [#if design-links-use-external-link-icon [#body#h(design-text-font-size/4)#box(
        fa-icon("external-link", size: 0.7em),
        baseline: -10%,
      )] else [#body]]
  body = [#set text(fill: design-colors-links);#body]
  original-link(url, body)
}

// Last updated date text:
#if design-page-show-last-updated-date {
  let dx
  if design-section-titles-type == "moderncv" {
    dx = 0cm
  } else {
    dx = -design-entries-left-and-right-margin
  }
  place(
    top + right,
    dy: -design-page-top-margin / 2,
    dx: dx,
    text(
      [_#locale-catalog-last-updated-date-style _],
      fill: design-colors-last-updated-date-and-page-numbering,
      size: 0.9em,
    ),
  )
}

#let connections(connections-list) = context {
  set text(fill: design-colors-connections, font: design-header-connections-font-family)
  set par(leading: design-text-leading*1.7, justify: false)
  let list-of-connections = ()
  let separator = (
    h(design-header-horizontal-space-between-connections / 2, weak: true)
      + design-header-separator-between-connections
      + h(design-header-horizontal-space-between-connections / 2, weak: true)
  )
  let starting-index = 0
  while (starting-index < connections-list.len()) {
    let left-sum-right-margin
    if type(page.margin) == "dictionary" {
      left-sum-right-margin = page.margin.left + page.margin.right
    } else {
      left-sum-right-margin = page.margin * 4
    }

    let ending-index = starting-index + 1
    while (
      measure(connections-list.slice(starting-index, ending-index).join(separator)).width
        < page.width - left-sum-right-margin
    ) {
      ending-index = ending-index + 1
      if ending-index > connections-list.len() {
        break
      }
    }
    if ending-index > connections-list.len() {
      ending-index = connections-list.len()
    }
    list-of-connections.push(connections-list.slice(starting-index, ending-index).join(separator))
    starting-index = ending-index
  }
  align(list-of-connections.join(linebreak()), design-header-alignment)
  v(design-header-vertical-space-between-connections-and-first-section - design-section-titles-vertical-space-above)
}

#let three-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (left, auto, right),
) = (
  if design-section-titles-type == "moderncv" [
    #three-col(
      left-column-width: right-column-width,
      middle-column-width: left-column-width,
      right-column-width: 1fr,
      left-content: right-content,
      middle-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      right-content: middle-content,
      alignments: (design-text-date-and-location-column-alignment, left, auto),
    )
  ] else [
    #block(
      [
        #three-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          middle-content: middle-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let two-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, design-text-date-and-location-column-alignment),
  column-gutter: design-entries-horizontal-space-between-columns,
) = (
  if design-section-titles-type == "moderncv" [
    #two-col(
      left-column-width: right-column-width,
      right-column-width: left-column-width,
      left-content: right-content,
      right-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      alignments: (design-text-date-and-location-column-alignment, auto),
    )
  ] else [
    #block(
      [
        #two-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let one-col-entry(content: "") = [
  #let left-space = design-entries-left-and-right-margin
  #if design-section-titles-type == "moderncv" [
    #(left-space = left-space + design-entries-date-and-location-width + design-entries-horizontal-space-between-columns)
  ]
  #block(
    [#set par(spacing: design-text-leading); #content],
    breakable: design-entries-allow-page-break-in-entries,
    inset: (
      left: left-space,
      right: design-entries-left-and-right-margin,
    ),
    width: 100%,
  )
]

= Chandan

// Print connections:
#let connections-list = (
  [#fa-icon("location-dot", size: 0.9em) #h(0.05cm)Bangalore, India],
  [#box(original-link("mailto:chandancvp08@gmail.com")[#fa-icon("envelope", size: 0.9em) #h(0.05cm)chandancvp08\@gmail.com])],
  [#box(original-link("tel:+91-76766-54906")[#fa-icon("phone", size: 0.9em) #h(0.05cm)076766 54906])],
  [#box(original-link("https://iamchandan.vercel.app/")[#fa-icon("link", size: 0.9em) #h(0.05cm)iamchandan.vercel.app])],
  [#box(original-link("https://linkedin.com/in/chandan-cv-3320441b4")[#fa-icon("linkedin", size: 0.9em) #h(0.05cm)chandan-cv-3320441b4])],
  [#box(original-link("https://github.com/Chandan-CV")[#fa-icon("github", size: 0.9em) #h(0.05cm)Chandan-CV])],
)
#connections(connections-list)



== Education


// YES DATE, YES DEGREE
#three-col-entry(
  left-column-width: 1cm,
  left-content: [],
  middle-content: [
    #strong[Manipal Institute of Technology], B.Tech in Computer Science and Engineering with Specialization in AI
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Courses: Generative AI, Data Mining, Neural Networks and Deep Learning, Natural Language Processing, Pattern Recognition, Machine Learning, Data Structures, Algorithms, Database Management Systems, Object-Oriented Programming, Discrete Mathematics, Probability and Statistics, Linear Algebra, Calculus, Essentials of Management, Computer vision],)
  ],
  right-content: [
    Bangalore

Sept 2022 – May 2026
  ],
)



== Experience


#two-col-entry(
  left-content: [
    #strong[Airbus], Associate Systems Engineer
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Working on the Vendor Information Manual \(VIM\) to enable airlines resolve Aircraft on Ground \(AOG\) situations as quickly as possible.],)
  ],
  right-content: [
    Bangalore, India

July 2026 – present
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Airbus], Software Engineering Intern
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Architecting and scaling AI-Forge and CV-Forge, an enterprise no-code computer vision platform streamlining AI deployment for Airbus’s Final Assembly Lines and R&D divisions.],[Own the CV Model Arena Feature, enabling users to visually compare the detection capabilities of different computer vision models.],[Added data persistance to improve UX on a pipeline based platform on CV-Forge],[Bought up the backend test coverage from 54\% to 84\% in 2 weeks],[Added support for events logging on CV-Forge to help the user read information a lot faster],[Integrated the new Multizone feature on CV-Forge, enabling users to create multiple zones of interest on their video feeds and get analytics for each zone separately],)
  ],
  right-content: [
    Bangalore, India

Jan 2026 – July 2026
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Segwise.ai], Software Engineering Intern
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Architected and implemented an enterprise-grade User Access Management system with hierarchical inheritance structure, significantly enhancing security and client control.],[Created a new Subscriptions feature enabling clients to get their reports and boards on their email or slack at their desired frequency.],[Developed \"Fatigue Reports\" helping performance marketers identify fatiguiging creatives early on and take corrective actions.],[Created an internal tool for our customer success team to help them manage customer data and run corrective ECS tasks when required.],[Integrated Youtube and Google Display Network \(GDN\) data fetching for our clients helping them get analytics for these ads.],[Created a competitor tool on our dashboard helping marketers get a feed of their competitor’s ads to get inspiration for their next campaigns.],[Maintaining backend servers written in Golang and Python],[Handling deployments on AWS Fargate with end-to-end responsibility for features],)
  ],
  right-content: [
    Bangalore, India

June 2025 – Dec 2025
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Andwemet], Software Development and Machine Learning Engineering Intern
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Rebuilt the entire onboarding process, making it 3x faster than the previous one.],[Created an ML recommendation engine to help 400+ people find matches only using google sheets],[Part of the  React Native Expo app team to make the app more accessible],[Built the community feature for the users to interact with each other to add another dimension to dating],[Integrated the backend \(node\) with the frontend \(Expo React-Native\).],[Built an admin dashboard to manage the posts and verify users using retool],)
  ],
  right-content: [
    Bangalore, India

Apr 2024 – Oct 2024
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Footloose Labs], Robotics Intern
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Building Nandi, an Autonomous Mobile Robot \(AMR\), used for hospital intralogistics],[Increases the efficiency and uptime of hospital intralogistics by 150\%],[Worked on the project to control the local swarm using an Elastic Compute Cloud \(EC2\) instance],[Used REST APIs, Flask, Node, Linux, AWS Elastic Compute Cloud \(EC2\)],)
  ],
  right-content: [
    Bangalore, India

May 2024 – July 2024
  ],
)



== Projects


#two-col-entry(
  left-content: [
    #strong[SIMS - Semantic Image Search for Android]
  ],
  right-content: [
    #link("https://www.instagram.com/reel/Da6LbhqzES6/?utm_source=ig_web_copy_link&stkn=MzRlODBiNWFlZA==")[Build In public first video]
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Semantic Image Search for android using a CLIP Model \(Apple's Mobile CLIP SO\)],[On device inference using onnx and flutter],[Super fast search using Turso's inbuilt vector search],[MobileCLIP SO is quantized and ported to onnx runtime for it to be lightweight and on device inference],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Signo]
  ],
  right-content: [
    #link("https://devfolio.co/projects/signo-9244")[Devfolio project page]
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Helps dumb and deaf people communicate on video call by translating ASL to plain English and displaying it as subtitles in their video stream],[Tools Used: Python + Tensorflow + Keras + Mediapipe + kivy + opencv],[Achievements: Came 2nd in JIT Hacks, Bangalore],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Diarama]
  ],
  right-content: [
    #link("https://www.diarama.ink/")[diarama.ink]
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Generate diagrams with AI],[Tools Used: Node + Gemini + NextJS + MongoDB + Tailwind],[Built for a video series Weekend builds: #link("https://www.linkedin.com/posts/chandan-cv-3320441b4_webdev-computerscience-gemini-activity-7271385419609468928-eusd?utm_source=share&utm_medium=member_desktop")[ep 1]],[Currently building in public],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Turse]
  ],
  right-content: [
    #link("https://devfolio.co/projects/ularn-3019")[Devfolio project page]
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([The first learning platform that uses youtube as a content library and empowers users to create courses using youtube videos],[Won one of the biggest hackathons in India, Hack-a-nova],[Got recognition from the largest student community in India, BlueLearn],[Currently in alpha stage],[Built using NextJS, Firebase, MySQL, Prisma, and Railway.],)
  ],
)

#v(design-entries-vertical-space-between-entries)

#one-col-entry(
  content: [
    #strong[Freelance projects]

    #v(-design-text-leading)
    #v(design-highlights-top-margin);#highlights([#link("https://www.icrafmn2024.com/")[ICRAFMN 2024]: built for Manipal University Jaipur | Svelte + Tailwind],[#link("https://flashback-one.vercel.app/")[Flashbakc]: built for Flashbakc | Vite + React, Supabase, Tailwind],[#link("https://www.yogawithmanu.in")[Yoga With Manu] | Next.js + Tailwind],[#link("https://www.maheblrmun.com/")[MAHE BLR MUN] built for MAHE BLR ],)
  ],
)



== Leadership Experience


#two-col-entry(
  left-content: [
    #strong[Head \@ Hack Solstice]
  ],
  right-content: [
    May 2023
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Organized the largest hackathon of college],[Directly managed 9 sponsors including Schneider Electric, Devfolio, Soloana, Replit and many more],[Received more than 750 applications],[Gained a Hackathon rating of 3.9 on devfolio.],[built the #link("https://hacksolstice.vercel.app/")[Hack Solstice website] using Next.js and Tailwind],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[IT Head \@ Falak, MIT Bengaluru]
  ],
  right-content: [
    May 2023
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Created the fest website in 2 weeks],[Streamlined concert pass verification using QR codes on phone],[Built and maintained the backend, payments and business data],[Built the #link("https://falak-mitblr.vercel.app/")[Falak website] using Next.js and Firebase],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Head, OpenSource \@ CodeX, MITBLR]
  ],
  right-content: [
    May 2023
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Largest club of college with 900+ members],[Conducted multiple workshops and competitions to help the community],)
  ],
)



== Technologies


#one-col-entry(
  content: [#strong[Languages:] Python, JavaScript, TypeScript, Dart, Golang, Java]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Web and Mobile Frameworks:] React, Svelte, NextJS, Flutter, React-Native, Android Studio]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Cloud \/ Devops:] Linux, Vercel, Amazon Web Services \(AWS\), Google Cloud Platform \(GCP\), Docker, Git, Github]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Databases:] MySQL, Postgres, MongoDB, Firebase \(Firestore\), Supabase, SQLite]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Tools:] NodeJS, Flask, Gin \(Golang\)]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[BAAS \/ PaaS:] Firebase, Supabase, Vercel, Heroku]
)


