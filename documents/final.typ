#set page(
  numbering: "1/1",
  paper: "us-letter",
  margin: 1.0in,
)

#show link: it => text(fill: rgb(24, 118, 153), underline(it))

#set par(
  // leading: 6pt,
  first-line-indent: 2em,
  // justify: true
)

#set text(
  font: ("Noto Serif", "STKaiti"),
  size: 10pt,
)

#set cite(
  style: "american-psychological-association",
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
Zhen Li \ zhenli.craig\@gatech.edu

#show heading.where(level: 1): (it) => {
  v(18pt)
  text(weight: 500, size: 14pt)[#it]
  v(6pt)
}

#show heading.where(level: 2): (it) => {

  v(6pt)
  text(weight: 500)[#it]
  v(6pt)
}

#show cite: it => {
  text(fill: rgb(24, 118, 153))[#it]
}


= Introduction

Greetings are a type of speech act that serves to establish and maintain social relationships. They are a fundamental part of everyday communication, and their usage and form are influenced by social and cultural factors. This project investigates the evolving nature of Chinese greetings, focusing on the use of question forms like “你吃了吗?” (nǐ chī le mā, _Have you eaten?_) and “你好吗?” (nǐ hǎo mā, _How are you?_), compared to non-question forms, “你好!” (nǐ hǎo, _Hello!_) and “早上好!” (zǎo shàng hǎo, _Good morning!_). Contrary to the commonly used greeting “How are you doing?” in English, there's an observation that such question forms are less prevalent in Chinese greetings, especially among strangers. 

To unveil the underlying reasons for this phenomenon, in this project, we examine the diachronic changes in the use of question and non-question forms in Chinese greetings. By analyzing a conversational corpus alongside a set of diachronically categorized movie subtitles, we aim to understand how these greetings have changed over time and what these changes reveal about Chinese society and culture. This examination can be part of a broader inquiry into the nature of language as an evolving entity that mirrors social dynamics. In addition to a statistical approach, we also attempt to delve into the pragmatics and sociocultural significance of these greetings, exploring the relationship between changing Chinese greating patterns and the social context.

= Literature Review 

== Greetings

@Duranti_1997 proposed a operational definition for analyzing greetings across languages and the relationships between conventional expressions. Duranti's six criteria for alternative uses of daily expressions like greetings are instrumental in understanding the substantive and social purposes of these linguistic interactions. 

@gumperz2015interactional and @Boxer_2002 delve into the broader field of sociolinguistics and interactional studies, providing foundational concepts and methodologies such as interactional sociolinguistics and conversation analysis that are essential for analyzing greeting behaviors in different social settings.


== Previous Research on Chinese Greetings 


@XIA2023156's study provides a historical context, tracing the evolution of greeting culture in China from the 17th to the 20th century. It reveals a shift towards impersonalization in greetings, increased semantic informativeness, and a departure from traditional politeness norms of self-denigration and other-elevation. This historical perspective is crucial for understanding the current state of Chinese greeting practices.


@Liu_2016 and @House_2022 focus specifically on the comparison between English and Chinese greetings. Liu underscores the significance of greetings in social identity and cross-cultural communication, while House addresses the challenges Chinese learners of English face due to pragmatic differences in greeting conventions. House's inclusion of empirical studies adds depth to our understanding of these challenges.

@曲卫国_2001 contribute to the understanding of demographic and linguistic specifics. He offers a detailed analysis of the linguistic form, topic, and pragmatic constraints of Chinese greetings, highlighting their openness, convertibility, and diversity.

Overall, these works collectively offer a comprehensive view of the sociolinguistic and pragmatic aspects of greetings in Chinese and English, emphasizing historical evolution, comparative analysis, and the influence of social and cultural factors on these everyday linguistic practices.

= Data and Methodology 

== Research questions

In this project, we analyze 2 representative dataset for Chinese greetings. The first dataset is MAGICDATA Mandarin Chinese Conversational Speech Corpus @yang2022open. The second dataset is a set of movie subtitles for Chinese movies, ranging from 1960s to 2020s. They are obtained from #link("https://srtku.com")[Srtku], which is a website for downloading movie and TV show subtitles. These two datasets are chosen because they contains a representative set of daily conversations. The first dataset consists of 219,325 lines of speach and the second dataset consists of about 50 movies for each decade, enabling us to analyze the diachronic changes of Chinese greetings.

By comparing the usage of the greetings in the 2 datasets, we aim to answer the following three questions:

#box()[
+ Are there any diachronic changes of greetings used in Chinese conversations?

+ If yes, what are the differences?

+ What are the socio-historical motivations underlying these differences?
]

== Data Collection


In this study, we intend to extract the greetings from the coversation a corpus and movie subtitles and count their frequency of appearance to analyze the differences in their usage and context.

The corpus, MAGICDATA Mandarin Chinese Conversational Speech Corpus, includes 180 hours of Mandarin Chinese speech from 633 speakers. All the transcripts are joined into a #link("https://github.com/li3zhen1/sociolinguistics-greeting-analysis/blob/main/mandarin_conversation/mandarin_conversational_corpus_combined_scripts.txt")[219,325 line file] for further analysis.


#let arr = (40, 101, 201, 169, 90, 142, 77)


The movie subtitles are crawled from #link("https://srtku.com")[Srtku]. We use the movie lists from #link("https://movie.douban.com/explore")[Douban], an online movie database that provides rich filters for movie search. This website provides recommendations for movies from different decades, which enabled us to perform a diachronic analysis over a representative set of movies. For each decade from 1960s to 2020s, we select the recommended 200\~300 movies and download their subtitles from Srtku. After cleaning, the final dataset contains #str(
  arr.at(0) + arr.at(1) + arr.at(2) + arr.at(3) + arr.at(4) + arr.at(5) + arr.at(6)
) readable movie subtitles in total:

#figure(
  table(
    columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
    [1960s], [1970s], [1980s], [1990s], [2000s], [2010s], [2020s],
    [#arr.at(0)], [#arr.at(1)], [#arr.at(2)], [#arr.at(3)], [#arr.at(4)], [#arr.at(5)], [#arr.at(6)],
  ),
  caption: "Number of movies for each decade",
)

While the dataset consists of only movie dialogues, primarily captures the perceptions of scriptwriters and directors regarding daily conversations, and thus only represents a limited subset of actual conversational patterns — or perhaps even only prestige forms adopted by the movie creators — it offers valuable insights into broader linguistic trends in greetings. 

== Greeting Extraction

We use a naïve regular expression approach to extract the greetings from the corpus and movie subtitles. For each category of greetings (non-question forms and question forms), 2 regular expressions are designed to match the most frequently used greetings in daily conversations. The regular expressions are listed in @RegTable. 

// the frequency of greetings with regular expressions (@RegTable) below.
//  count the frequency of greetings from the subtitles with regular expressions (@RegTable) below and analyze the differences in their usage and context.


// The subtitles are downloaded from #link("https://srtku.com")[Srtku]. 

//  count the frequency of greetings from the subtitles with regular expressions (@RegTable) below and analyze the differences in their usage and context. 

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
        r'((?<!\p{Han})吃[过]?[饭]?了[吗么没嘛啊](?!\p{Han}))'
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

), 

caption: "Regular expressions for matching greetings",

)<RegTable>

\ Take the first regular expression as an example, there are 5 major parts:

#box(stroke: 0.5pt+black, inset: 1em, width: 100%)[
+ `(?<!\p{Han})`: matches the position where the previous character is not a Hanzi character. The `\p{Han}` represents any character in the Unicode Han script.
+ `(你|您)`: matches either `你` (nǐ, _you_) or `您` (nín, formal _you_).
+ `好`: matches `好` (hǎo), which translates to _"good"_ or _"well"_ in English.
+ `[啊]?`: matches one or zero times of `啊` (ā, an exclamation or modal particle used for emphasis or mood).
+ `(?!\p{Han})`: matches the position where the next character is not a Hanzi character.
]
 
The leading and trailing `(?<!\p{Han})` and `(?!\p{Han})` are used to avoid disambiguation from the sentences like "*你好*棒" (_You are so amazing_). All possible sentences matched by regexes used in this project represents a sentence with similar meanings, but in some scenario they might convey more of a contextual meaning and hence not a standard "greeting" defined by @Duranti_1997. Detailed explanation for other 3 regular expressions can be found in @regex-explain.


After matching the greetings with regular expressions, the occurences of greetings in the corpus and movie subtitles are counted respectively and displayed in @occ. The results are visualized as the normalized stacked area chart shown in @viz.

#figure(
  {
  let results = csv("../regex_sum.csv")

  align(horizon,table(
    columns: 5,
    [*Decade*], [
      (你|您)好[啊]? \
      #text(8pt)[_Hello!_]
    ], [(上午|下午|晚上|中午|早上)好[啊]? \
      #text(8pt)[_Good morning/afternoon/...!_]], [(你|您)(最近)?好[吗么没嘛啊] \
      #text(8pt)[_How are you?_]],[吃[过]?[饭]?了[吗么没嘛啊] \
      #text(8pt)[_Have you eaten?_]],
    ..results.flatten(),

    [MAGICDATA Corpus], [8], [0], [0], [1],
  ) )
  },
  caption: "Occurences of greetings in the MAGICDATA Mandarin Chinese Conversational Speech Corpus and movies",
)<occ>
#v(40pt)


#figure(
  {
    image("visualization.svg", width: 90%)
  },
  caption: "Changes of the frequency of greetings in the movie subtitles from 1960s to 2020s",
)<viz>
 
#v(40pt)


= Result and Discussion  



We can observe an obvious decline of question forms and a rise of non-question forms. Specifically, the usage of `(你|您)(最近)?好[吗么没嘛啊]` (_How are you?_) has been a major part of decline in question forms. 





// == The Decline of Question Forms

To further explore the reason behind the decline in the use of question form greetings, we specifically analyze dialogues from _Rickshaw Boy_ and _A Better Tomorrow II_, as highlighted in @rickshaw and @howareyou1. These instances demonstrate a strong correlation between the use of question form greetings and the conversation's context.


#let sp = h(0.6em)


#figure(
  box(stroke: 0.5pt, width: 100%, inset:1em )[


  #align(left)[
  \- 吃饭了吗 \
  #sp #text(size: 8pt)[_Have you eaten?_]
  ]



#align(right)[
\- 还没拉上座儿呢\
#sp #text(size: 8pt)[_No business yet._]
]


#align(left)[
\- 我这有钱#sp 先拿去吃饭吧 \ 
#sp #text(size: 8pt)[_I have some money here, take it and go eat first._]
]

#v(2pt)

  ],
  caption: [A dialogue from the movie 《骆驼祥子》 (_Rickshaw Boy_, China mainland, 1982)],
)<rickshaw>


#figure(
  box(stroke: 0.5pt, width: 100%, inset:1em )[
#align(left)[
\- 胡Sir#sp 你还是不要退休了 #sp 还有很多事情等着你做 \
#sp #text(size: 8pt)[_Hu Sir, you shouldn't retire. There are still many things waiting for you to do._]
]



// #v(2pt)
#align(right)[
\- Ken哥#sp 我们很挂念你#sp 你好吗?  \
#sp #text(size: 8pt)[_Ken, we miss you so much. How are you doing?_]

#v(2pt)
  ]


  ],
  caption: [A dialogue from the movie 《英雄本色》 (_A Better Tomorrow II_, Hong Kong, 1987)],
)<howareyou1>

#v(4pt)

In _Rickshaw Boy_, the greeting "_Have you eaten?_" is closely tied the context where the listener is a rickshaw puller and led a difficult life, struggling to make ends meet. This greeting is a query about the need of food mixed with concern for the other's well-being, reflecting the socio-economic status of the speakers, emphasizing basic needs and communal care. 

In the second example from _A Better Tomorrow II_, the greeting "_How are you doing?"_ emerges in a context of reunion. Here, it serves as an expression of longing and reconnection, indicating the speaker's concern after a prolonged separation. Compared to the commonly used English version of this greeting, the Chinese version serves more as an expression of genuine concern and longing, marking the re-establishment of a connection after a period of separation. 

The close relationship between the context and the use of question form greetings resonates the analysis from @曲卫国_2001 — because of the openness of the topic, Chinese greetings are highly dependent on the context. Its specific use is restricted by many pragmatic factors. These examples also underscore how the function and significance of question form greetings in Chinese are deeply interwoven with the speakers' social dynamics and the situational context. Non-question form greetings like "_Hello!_" are more impersonal and less context-dependent, and thus emerging as a more common form of greeting.

The ongoing change of greeting patterns is a reflection of the change of contemporary Chinese society. The trend of greeting patterns in movie subtitles is consistent with the result from @XIA2023156's study. By studying classic Chinese literatures, they found that Chinese greetings between new acquaintances in the 20th century exhibit a tendency of “impersonalization” in terms of topic selection and the use of sentence patterns. 






= Conclusion 

This project has provided a comprehensive analysis of the evolution of Chinese greetings, examining their transition from question forms like “你吃了吗?” (_Have you eaten?_) and “你好吗?” (_How are you?_) to non-question forms such as “你好!” (_Hello!_) and “早上好!” (_Good morning!_). Through an quantitative analysis of conversational corpora and movie subtitles, we have traced the diachronic changes in greeting practices and explored their sociocultural implications.

Our findings indicate a shift in greeting practices within Chinese society. The decline in question form greetings and the rise of non-question forms reflect broader sociocultural changes, including shifts towards greater impersonalization, and alterations in politeness norms. These trends mirror the ongoing transformations in Chinese social dynamics and cultural practices.





#set par(
  first-line-indent: 0em
)

#pagebreak()
#bibliography("./main.bib", style: "american-psychological-association") 


#set heading(
  numbering: none
)

#pagebreak()
 

= #text(size: 24pt)[Appendix]
\


#set heading(
  numbering: "A.a"
)
 
All the code and data used in this project can be found at the repository #link("https://github.com/li3zhen1/sociolinguistics-greeting-analysis")[sociolinguistics-greeting-analysis].


= Explanation of the Regular Expressions<regex-explain>

\

Constraints for avoiding surruounding Hanzi characters are omitted below. 


== Non-question form: `(?<!\p{Han})(上午|下午|晚上|中午|早上)好[啊]?(?!\p{Han})` (_Good morning / evening / ... !_)

#box(stroke:0.5pt+black, inset: 1em, width: 100%)[

- `(上午|下午|晚上|中午|早上)`: matches either `上午` (shàngwǔ, _morning_), `下午` (xiàwǔ, _afternoon_), `晚上` (wǎnshàng, _evening_), `中午` (zhōngwǔ, _noon_), or `早上` (zǎoshàng, _early morning_).

- `好`: matches `好` (hǎo), which translates to _"good"_ or _"well"_ in English.
]
\


== Question form: `(?<!\p{Han})(你|您)(最近)?好[吗么没嘛啊](?!\p{Han})`  (_How are you?_)


#box(stroke:0.5pt+black, inset: 1em, width: 100%)[

- `(你|您)`: matches either `你` (nǐ, _you_) or `您` (nín, formal _you_).

- `(最近)?`: matches one or zero times of `最近` (zuìjìn, _recently_).

- `好`: matches `好` (hǎo), which translates to _"good"_ or _"well"_ in English.

- `[吗么没嘛啊]`: matches either `吗` (ma, question particle), `么` (me, question particle), `没` (méi, negative particle), `嘛` (ma, modal particle), or `啊` (ā, an exclamation or modal particle used for emphasis or mood). In this greeting, they are used as modal particles.
]
\

== Question form: `(?<!\p{Han})吃[过]?[饭]?了[吗么没嘛啊](?!\p{Han})` (_Have you eaten?_)
#box(stroke:0.5pt+black, inset: 1em, width: 100%)[
- `吃`: matches `吃` (chī, _eat_).

- `[过]?`: matches one or zero times of `过` (guò, a mark indicating the completion of an action). 

- `[饭]?`: matches one or zero times of `饭` (fàn, _meal_).

- `了`: matches `了` (le, perfective particle).

- `[吗么没嘛啊]`: matches either `吗` (ma, question particle), `么` (me, question particle), `没` (méi, negative particle), `嘛` (ma, modal particle), or `啊` (ā, an exclamation or modal particle used for emphasis or mood). In this greeting, they are used as modal particles.
]
\


\* Full width puctuations, such as `。` and `？`, are not matched by `\p{Han}`.

\* The standard library `re` in Python doesn't support Unicode property escapes like `\p{Han}`. I used the #link("https://pypi.org/project/regex/")[regex] library instead.

\

= Obtaining Movie Subtitles

+ Collect the movie names from #link("https://movie.douban.com/explore")[Douban Explore] to filter the movies. Paste the #link("https://github.com/li3zhen1/sociolinguistics-greeting-analysis/blob/main/captions/script.js")[scripts] in the browser console and it will automatically click the expand button for 10 times and print 200 \~ 300 movie names in the console.

+ Run `movie_caption_crawl.ipynb` to crawl the movie subtitles. Switch IP if blocked by the website.
  
  - The movie names are only fuzzy matched in the search box of zimuku.net. Some manual work is needed to remove the wrong matches.

+ Run `clean.ipynb` to clean the downloaded subtitles.

+ Run `encoding.ipynb` to convert the subtitles from `UTF-8 with BOM` / `GB2312` to `UTF-8` encoding.

\

= Analyzing Conversational Corpus and Movie Data

+ Run `count_regex.ipynb` to count the appearances of greetings in subtitles by regex matches.

  - Run `eda.ipynb` to aggregate the results.

  - Copy the generated `regex_sum.json` to `visualization.html` and open it in a browser to visualize the results.

+ Run `count_magic.ipynb` to count the appearances of greetings in the corpus by regex matches.

All subtitles can be found in the `caption` folder.

Results can be found in the root folder.