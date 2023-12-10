#set page(
  numbering: "1/1",
  paper: "us-letter",
  margin: 0.85in,
)

#set heading(
  numbering: "1.1"
)

#set par(
  // leading: 6pt,
  first-line-indent: 2em
)

#set text(
  font: ("New York Small", "Noto Serif SC") 
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
   fill:rgb("#f5f6f7"), outset: (top:2pt, x: 3pt, bottom: 3pt))[#text(font: ("SF Mono", "PingFang SC"))[#it]] 
)

#set table(stroke: 0.6pt)

= #text(weight: 500, size: 16pt)[A Comparative Study of Chinese and English Greetings: \ "#text(weight: 600, size: 16pt)[你吃了吗?]", "#text(weight: 600, size: 16pt)[你好吗?]" and "How are you doing?"]



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

The questions “你吃了吗？”(pinyin: nǐ chī le mā? English: Have you eaten?)” and “你好吗？”(pinyin: nǐ hǎo mā? English: How are you?) are often compared to “How are you doing?” when studying greetings in Chinese. But in fact, questions are very commonly used in the United States, not common in greetings between Chinese, especially strangers. This paper will take a statistic approch to compare the usage of those 3 greetings, and analyze the differences in their usage and pragmatics, trying to provide a diverse and insightful perspective on the evolution, pragmatics, and sociocultural implications of these greetings.

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
In this paper, we analyze 2 representative dataset for Chinese greetings. The first dataset is #sb[MAGICDATA Mandarin Chinese Conversational Speech Corpus] @yang2022open. The second dataset is a set of movie subtitles for Chinese movies, ranging from 1960s to 2020s. They are obtained from #link("https://srtku.com")[Srtku], which is a website for downloading movie and TV show subtitles in various languages. These two datasets are chosen because they contains a representative set of daily conversations. The first dataset consists of 219,325 lines of speach and the second dataset consists of about 50 movies for each decade, enabling us to analyze the diachronic changes of Chinese greetings.

By comparing the usage of the greetings in the 2 datasets, we aim to answer the following three questions:

#box()[
+ Are there any diachronic changes of greetings used in Chinese conversations?

+ If yes, what are the differences ?

+ What are the socio-historical motivations underlying these differences?
]
== Data Collection


In this study, we count the frequency of greetings from the subtitles with regular expressions (@RegTable) below and analyze the differences in their usage and context. 

#figure(

grid(
  gutter: 3pt,
  columns: (100%),
table(
  columns: (auto, 1fr),
  [Regular expression], [Matched target],
  [`/[^\p{script=Han}]你好[^\p{script=Han}]/`], [“你好” with no Hanzi characters before or after],
  [`/[^\p{script=Han}]你好吗[^\p{script=Han}]/`], [“你好吗” with no Hanzi characters before or after],
  [`/吃了吗[^\p{script=Han}]/`], [“吃了吗” with no Hanzi characters after],
),
v(3pt),
text(10pt)[\* Full width puctuations, such as `。` and `？` are not matched by `\p{script=Han}`.],
v(3pt)

), 

caption: "Regular expressions for matching greetings",

)<RegTable>





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

== Data Crawling Scripts



== Data Result