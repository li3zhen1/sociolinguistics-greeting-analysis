#set page(
  numbering: "1/1",
  paper: "us-letter",
  margin: 0.85in,
)

#show link: it => text(fill: rgb(24, 118, 153), underline(it))

#set par(
  // leading: 6pt,
  first-line-indent: 2em
)

#set text(
  font: ("Noto Serif", "STKaiti"),
  size: 9.5pt,
)

#set cite(
  style: "american-psychological-association"
)

#let sb = (it) => {
  text(weight: 500, style: "italic")[#it]
} 

#show raw: it => box(
  inset: (x: 4pt),
  box(radius: 2pt,
  //  stroke: 0.5pt+rgb("#aaa"), 
   fill:rgb("#f1f2f6"), outset: (top:2pt, x: 3pt, bottom: 3pt))[#text(font: ("SF Mono", "PingFang SC"))[#it]] 
)

#set table(stroke: 0.6pt)

= #text(weight: 500, size: 16pt)[Transformations in Chinese Greeting Expressions: \ A Diachronic Analysis of Question and Non-Question Forms]
// [A Comparative Study of Chinese and English Greetings: \ "#text(weight: 600, size: 16pt)[你吃了吗?]", "#text(weight: 600, size: 16pt)[你好吗?]" and "How are you doing?"]

#set heading(
  numbering: "1.1"
)


#v(14pt)
Zhen Li

#show heading.where(level: 1): (it) => {
  v(8pt)
  text(weight: 500, size: 14pt)[#it]
  v(4pt)
}

#show heading.where(level: 2): (it) => {

  v(6pt)
  text(weight: 500)[#it]
  v(3pt)
}


= Introduction

Greetings are a type of speech act that serves to establish and maintain social relationships. They are a fundamental part of everyday communication, and their usage and form are influenced by social and cultural factors. This paper investigates the evolving nature of Chinese greetings, focusing on the use of question forms like “你吃了吗?” (_Have you eaten?_) and “你好吗?” (_How are you?_), compared to non-question forms, “你好!” (_Hello!_) and “早上好!” (_Good morning!_). Contrary to the common comparison with “How are you doing?” in English, such question forms are less prevalent in Chinese greetings, especially among strangers. 

By analyzing a conversational corpus alongside movie subtitles crawled from a Chinese movie resource website, we aim to understand how these greetings have changed over time and what these changes reveal about Chinese society and culture. This examination can be part of a broader inquiry into the nature of language as an evolving entity that mirrors social dynamics. In addition to a statistical approach, we also attempt to delve into the pragmatics and sociocultural significance of these greetings, contributing to our understanding of language's role in reflecting and influencing social interactions.

= Literature Review 

== Greetings






== Previous Research on Chinese Greetings 

The literature on the comparative study of greetings in Chinese and English languages, especially focusing on expressions such as "你吃了吗？(Have you eaten?)", "你好吗？(How are you?)" in Chinese, and "How are you doing?" in English, offers a diverse and insightful perspective on the evolution, pragmatics, and sociocultural implications of these greetings.

@XIA2023156's study provides a historical context, tracing the evolution of greeting culture in China from the 17th to the 20th century. It reveals a shift towards impersonalization in greetings, increased semantic informativeness, and a departure from traditional politeness norms of self-denigration and other-elevation. This historical perspective is crucial for understanding the current state of Chinese greeting practices.

@Duranti_1997 and @Juliane_2021 offer frameworks for analyzing greetings across languages and the relationships between conventional expressions and speech acts. Duranti's six criteria and Juliane's categorization system for alternative uses of daily expressions like greetings are instrumental in understanding the substantive and social purposes of these linguistic interactions.

@Liu_2016 and @House_2022 focus specifically on the comparison between English and Chinese greetings. Liu underscores the significance of greetings in social identity and cross-cultural communication, while House addresses the challenges Chinese learners of English face due to pragmatic differences in greeting conventions. House's inclusion of empirical studies adds depth to our understanding of these challenges.

@gumperz2015interactional and @Boxer_2002 delve into the broader field of sociolinguistics and interactional studies, providing foundational concepts and methodologies such as interactional sociolinguistics and conversation analysis that are essential for analyzing greeting behaviors in different social settings.

@Bobgan_2000 and @曲卫国_2001 contribute to the understanding of demographic and linguistic specifics. Bobgan explores the influence of age and gender on responses to greetings in English, while 曲卫国 offers a detailed analysis of the linguistic form, topic, and pragmatic constraints of Chinese greetings, highlighting their openness, convertibility, and diversity.

Overall, these works collectively offer a comprehensive view of the sociolinguistic and pragmatic aspects of greetings in Chinese and English, emphasizing historical evolution, comparative analysis, and the influence of social and cultural factors on these everyday linguistic practices.
= Data and Methodology 

== Research questions

In this paper, we analyze 2 representative dataset for Chinese greetings. The first dataset is #sb[MAGICDATA Mandarin Chinese Conversational Speech Corpus] @yang2022open. The second dataset is a set of movie subtitles for Chinese movies, ranging from 1960s to 2020s. They are obtained from #link("https://srtku.com")[Srtku], which is a website for downloading movie and TV show subtitles. These two datasets are chosen because they contains a representative set of daily conversations. The first dataset consists of 219,325 lines of speach and the second dataset consists of about 50 movies for each decade, enabling us to analyze the diachronic changes of Chinese greetings.

By comparing the usage of the greetings in the 2 datasets, we aim to answer the following three questions:

#box()[
+ Are there any diachronic changes of greetings used in Chinese conversations?

+ If yes, what are the differences ?

+ What are the socio-historical motivations underlying these differences?
]
== Data Collection


In this study, we count the frequency of greetings from the subtitles with regular expressions (@RegTable) below and analyze the differences in their usage and context. 

#let table_line = line(stroke: 0.5pt+rgb("#000"), length: 100%)
#figure(

grid(
  gutter: 3pt,
  columns: (100%),
  grid(
    columns: (120pt, 1fr),
    rows: (0.5pt, auto, 0.5pt, 3.9em, 0.5pt, 3.9em, 0.5pt),
    table_line,table_line,
    box(inset: 0.5em)[*Category*], box(inset: 0.5em)[*Python syntax for the regular expression*],

    table_line,table_line,

    box(inset: (top:1.5em))[Non-question forms], box(height:36pt)[
      // `r'((?<!\p{Han})(你|您)好[啊]?(?!\p{Han}))'`
      // `r'((?<!\p{Han})(上午|下午|晚上|中午|早上)好[啊]?(?!\p{Han}))'`
      #box(inset: (top:0.5em, bottom: 0em))[
        ```Python 
        r'((?<!\p{Han})(你|您)好[啊]?(?!\p{Han}))'
        ```
      ]
      #box(table_line)
      #box(inset: (top:0em, bottom: 0.5em))[
        ```Python 
        r'((?<!\p{Han})(上午|下午|晚上|中午|早上)好[啊]?(?!\p{Han}))'
        ```
      ]
    ],

    table_line, table_line,

    box(inset: (top:1.5em))[Question forms], box(height:36pt)[
      #box(inset: (top:0.5em, bottom: 0em))[
        ```Python 
        r'((?<!\p{Han})(你|您)(最近)?好[吗么没嘛啊](?!\p{Han}))'
        ```
      ]
      #box(table_line)
      #box(inset: (top:0em, bottom: 0.5em))[
        ```Python 
        r'(吃[过]?[饭]?了[吗么没嘛啊](?!\p{Han}))'
        ```
      ]
    ],
    table_line,table_line,
  ),
// table(
//   columns: (auto, 1fr),
//   [Regular expression in Python], [Category],
//   [`r'((?<!\p{Han})(你|您)好[啊]?(?!\p{Han}))'`], [“你好” with no Hanzi characters before or after],
//   [`r'((?<!\p{Han})(上午|下午|晚上|中午|早上)好[啊]?(?!\p{Han}))'`], [“你好吗” with no Hanzi characters before or after],
//   [`r'((?<!\p{Han})(你|您)(最近)?好[吗么没嘛啊](?!\p{Han}))'`], [],
//   [`r'(吃[过]?[饭]?了[吗么没嘛啊](?!\p{Han}))'`], [“吃了吗” with no Hanzi characters after],
// ),
v(3pt),
text(10pt)[\* Full width puctuations, such as `。` and `？`, are not matched by `\p{script=Han}`.],
v(3pt)

), 

caption: "Regular expressions for matching greetings",

)<RegTable>


Take the first regular expression as an example, there are 5 major parts:

- `(?<!\p{Han})`: matches the position where the previous character is not a Hanzi character.
- `(你|您)`: matches either `你` or `您`.
- `好`: matches `好`.
- `[啊]?`: matches `啊` or nothing.
- `(?!\p{Han})`: matches the position where the next character is not a Hanzi character.

The leading and trailing `(?<!\p{Han})` and `(?!\p{Han})` are used to avoid disambiguation from the sentences like "*你好*快" (_You are so fast_).

#figure(
  {
    set text(
      font: ("SF Pro Text", "PingFang SC") 
    )
    image("visualization.svg")
    set text(
      font: ("Noto Serif", "STKaiti") 
    )
  },
  caption: "Visualization of the data",
)
 



= Result and Discussion  

#figure(

grid(
  gutter: 3pt,
  columns: (100%),
table(
  columns: (auto, 1fr),
  [Greeting], [Matches ],
  [你好], [],
  [你好吗 or 吃了吗], [],
),

),

caption: "Regular expressions for matching greetings",

)<Table1960>



= Conclusion 







#set par(
  first-line-indent: 0em
)

#pagebreak()
#bibliography("./main.bib", style: "american-psychological-association") 


#set heading(
  numbering: none
)

#pagebreak()
= Appendix

All the code and data used in this paper can be found at the repository #link("https://github.com/li3zhen1/sociolinguistics-greeting-analysis")[sociolinguistics-greeting-analysis].

== Obtaining and Analyzing Movie Subtitle Data

+ Collect the movie names from #link("https://movie.douban.com/explore")[Douban Explore] to filter the movies. Paste the #link("https://github.com/li3zhen1/sociolinguistics-greeting-analysis/blob/main/captions/script.js")[scripts] in the browser console and it will automatically click the expand button for 10 times and print 200 \~ 300 movie names in the console.

+ Run `movie_caption_crawl.ipynb` to crawl the movie subtitles. Switch IP if blocked by the website.

  - The movie names are only fuzzy matched in the search box of zimuku.net. Some manual work is needed to remove the wrong matches.

+ Run `clean.ipynb` to clean the downloaded subtitles.

+ Run `encoding.ipynb` to convert the subtitles from `UTF-8 with BOM` / `GB2312` to `UTF-8` encoding.

+ Run `stat.ipynb` to count the frequency of greetings by regex matches in the subtitles.

+ Run `eda.ipynb` to aggregate the results.

+ Copy the saved `regex_sum.json` to `visualization.html` and open it in a browser to visualize the results.


== Data Result