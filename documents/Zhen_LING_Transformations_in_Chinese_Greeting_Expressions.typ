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

= #text(weight: 500, size: 14pt)[Transformations in Chinese Greeting Expressions: \ A Diachronic Analysis of Interrogative and Non-Interrogative Forms]
// [A Comparative Study of Chinese and English Greetings: \ "#text(weight: 600, size: 16pt)[你吃了吗?]", "#text(weight: 600, size: 16pt)[你好吗?]" and "How are you doing?"]

#set heading(
  numbering: "1.1"
)


#v(20pt)
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

Greetings are a type of speech act that serves to establish and maintain social relationships. They are a fundamental part of everyday communication, and their usage and form are influenced by social and cultural factors. This project investigates the evolving nature of Chinese greetings, focusing on the use of questions like “你吃了吗?” (nǐ chī le mā, _Have you eaten?_) and “你好吗?” (nǐ hǎo mā, _How are you?_), compared to non-interrogative forms, “你好!” (nǐ hǎo, _Hello!_) and “早上好!” (zǎo shàng hǎo, _Good morning!_). Contrary to the commonly used greeting “How are you doing?” in English, there's an observation that such interrogative forms are less prevalent in Chinese greetings, especially among strangers. 

To unveil the underlying reasons for this observation, in this project, we examine the diachronic changes in the use of interrogative and non-interrogative forms in Chinese greetings. By analyzing a conversational corpus alongside a set of diachronically categorized movie subtitles, we aim to understand how these greetings have changed over time and what these changes reveal about Chinese society and culture. This examination can be part of a broader inquiry into the nature of language as an evolving entity that mirrors social dynamics. In addition to a statistical approach, we also attempt to delve into the pragmatics and sociocultural significance of these greetings, exploring the relationship between changing Chinese greating patterns and the social context.

= Literature Review 

== Greetings

Duranti proposed a operational definition for analyzing greetings across languages @Duranti_1997. Duranti's six criteria for alternative uses of daily expressions like greetings are instrumental in understanding the substantive and social purposes of these linguistic interactions. 

Gumperz and Boxer delve into the broader field of sociolinguistics and interactional studies, providing foundational concepts and methodologies such as interactional sociolinguistics and conversation analysis that are essential for analyzing greeting behaviors in different social settings @gumperz2015interactional @Boxer_2002.


== Previous Research on Chinese Greetings 


Xia's study provides a historical context, tracing the evolution of greeting culture in China from the 17th to the 20th century @XIA2023156. It reveals a shift towards impersonalization in greetings, increased semantic informativeness, and a departure from traditional politeness norms of self-denigration and other-elevation. This historical perspective is crucial for understanding the current state of Chinese greeting practices.


Liu and House focus specifically on the comparison between English and Chinese greetings. Liu underscores the significance of greetings in social identity and cross-cultural communication @Liu_2016, while House addresses the challenges Chinese learners of English face due to pragmatic differences in greeting conventions @House_2022. House's inclusion of empirical studies adds depth to our understanding of these challenges.

Qu offers a detailed analysis of the linguistic form, topic, and pragmatic constraints of Chinese greetings, highlighting their openness, convertibility, and diversity @曲卫国_2001.

Overall, these works collectively offer a comprehensive view of the sociolinguistic and pragmatic aspects of greetings in Chinese and English, emphasizing historical evolution, comparative analysis, and the influence of social and cultural factors on these everyday linguistic practices.

= Data and Methodology 

== Research questions

In this project, we analyze 2 representative datasets for Chinese greetings. The first dataset is MAGICDATA Mandarin Chinese Conversational Speech Corpus @yang2022open. The second dataset is a set of movie subtitles for Chinese movies, ranging from 1960s to 2020s. They are obtained from #link("https://srtku.com")[Srtku], which is a website for downloading movie and TV show subtitles. These two datasets are chosen because they contain a representative set of daily conversations. The first dataset consists of 219,325 lines of speech and the second dataset consists of about 50 movies for each decade, enabling us to analyze the diachronic changes of Chinese greetings.

By comparing the usage of the greetings in the 2 datasets, we aim to answer the following three questions:

#box()[
+ Are there any diachronic changes of greetings used in Chinese conversations?

+ If yes, what are the differences?

+ What are the social motivations behind these changes?
]

== Data Collection


In this study, we intend to extract the greetings from the conversation a corpus and movie subtitles and count their frequency of appearance to analyze the differences in their usage and context.

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

While the movie dialogues primarily capture the perceptions of scriptwriters and directors regarding daily conversations, or perhaps even only prestige forms adopted by the movie creators, it can reflect real-world conversational patterns and offer valuable insights into broader linguistic trends in greetings. 

== Greeting Extraction

We use a naïve regular expression approach to extract the greetings from the corpus and movie subtitles. For each category of greetings (non-interrogative forms and interrogative forms), 2 regular expressions are designed to match the most frequently used greetings in daily conversations. The regular expressions are listed in @RegTable. 

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
    columns: (132pt, 1fr),
    rows: (0.5pt, auto, 0.5pt, 50pt+1.5em, 0.5pt, 50pt+1.5em, 0.5pt),
    table_line,table_line,
    box(inset: 0.5em)[*Category*], box(inset: 0.5em)[*Regular expression and captured sentences*],

    table_line,table_line,

    box(inset: (top:1.5em+10pt))[Non-interrogative forms], box(height:48pt)[
      // `r'((?<!\p{Han})(你|您)好[啊]?(?!\p{Han}))'`
      // `r'((?<!\p{Han})(上午|下午|晚上|中午|早上)好[啊]?(?!\p{Han}))'`
      #box(inset: (top:0.5em, bottom: 0em))[
        ```Python 
        r'((?<!\p{Han})(你|您)好[啊]?(?!\p{Han}))'
        ```
        \
        Informal or formal _"Hello!"_
      ]
      #box(table_line)
      #box(inset: (top:0em, bottom: 0.5em))[
        ```Python 
        r'((?<!\p{Han})(上午|下午|晚上|中午|早上)好[啊]?(?!\p{Han}))'
        ```
        \
        _"Good morning/afternon/evening/noon/(early) morning!"_
      ]
    ],

    table_line, table_line,

    box(inset: (top:1.5em+10pt))[Interrogative forms], box(height:48pt)[
      #box(inset: (top:0.5em, bottom: 0em))[
        ```Python 
        r'((?<!\p{Han})(你|您)(最近)?好[吗么没嘛啊](?!\p{Han}))'
        ```
        \
        Informal or formal _"How are you doing?"_
      ]
      #box(table_line)
      #box(inset: (top:0em, bottom: 0.5em))[
        ```Python 
        r'((?<!\p{Han})(你|您)?(已经)?吃[过]?[饭]?了[吗么没嘛啊](?!\p{Han}))'
        ```
        \
        Informal or formal _"Have you eaten?"_
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


After matching the greetings with regular expressions, the occurrences of greetings in the corpus and movie subtitles are counted respectively and displayed in @occ. The results are visualized as the normalized stacked area chart shown in @viz.

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
      #text(8pt)[_How are you?_]],[(你|您)?(已经)?吃[过]?[饭]?了[吗么没嘛啊] \
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
    image("visualization.svg", width: 100%)
  },
  caption: "Changes of the frequency of greetings in the movie subtitles from 1960s to 2020s",
)<viz>
 
#v(40pt)


= Result and Discussion  



From @viz, we can observe an obvious decline of interrogative forms and a rise of non-interrogative forms. Specifically, the usage of `(你|您)(最近)?好[吗么没嘛啊]` (_How are you?_) has been a major part of decline in interrogative forms. 





// == The Decline of Question Forms

To further explore the reason behind the decline in the use of interrogative greetings, we specifically analyze dialogues from _Rickshaw Boy_, _A Better Tomorrow II_ and _A Journey Through Time with Antony_, as highlighted in @rickshaw, @howareyou1, @anthony. These instances demonstrate a strong correlation between the use of interrogative greetings and the conversation's context.


#let sp = h(0.6em)


#figure(
  box(stroke: 0.5pt, width: 100%, inset:1em )[


  #align(left)[
  \- 吃饭了吗 \
  #sp #text(size: 8pt)[_*Have you eaten?*_]
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
  caption: [A dialogue from the movie _Rickshaw Boy_ \ (骆驼祥子), China mainland, 1982],
)<rickshaw>

#v(12pt)


#figure(
  box(stroke: 0.5pt, width: 100%, inset:1em )[
#align(left)[
\- 胡Sir#sp 你还是不要退休了 #sp 还有很多事情等着你做 \
#sp #text(size: 8pt)[_Hu Sir, you shouldn't retire. There are still many things waiting for you to do._]
]



// #v(2pt)
#align(right)[
\- Ken哥#sp 我们很挂念你#sp 你好吗?  \
#sp #text(size: 8pt)[_Ken, we miss you so much. *How are you doing?*_]

#v(2pt)
  ]

 
  ],
  caption: [A dialogue from the movie _A Better Tomorrow II_ \ (英雄本色II), Hong Kong, 1987],
)<howareyou1>

#v(12pt)



#figure(
  box(stroke: 0.5pt, width: 100%, inset:1em )[
#align(left)[
\- 我们在澳洲#sp 就算是陌生人见面 #sp 也不说「嗨」#sp 而是说「你好吗」 \
#sp #text(size: 8pt)[_When we meet strangers in Australia, we don't say *"hi"*. We say *"How are you?"*_]
]



// #v(2pt)
#align(right)[
\- 你已经养成习惯了#sp 每次给我发讯息都说#sp 「你好吗？」  \
#sp #text(size: 8pt)[_You've adapted to this custom. You say *“How are you?”* every time you send me a message._]

#v(2pt)
  ]

 
  ],
  caption: [A dialogue from the movie _A Journey Through Time with Antony_ \ (陪安东尼度过漫长岁月), China mainland, 2015],
)<anthony>

#v(24pt)

In _Rickshaw Boy_ (@rickshaw), the greeting "_Have you eaten?_" is closely tied to the context where the listener is a rickshaw puller leading a difficult life, struggling to make ends meet. This greeting is a query about the need for food mixed with concern for the other's well-being, reflecting the socio-economic status of the speakers and emphasizing basic needs and communal care.

In the second example (@howareyou1) from _A Better Tomorrow II_, the greeting "_How are you doing?"_ is set against the backdrop of a reunion. This greeting conveys a care close to its literal meaning and reflects the speaker's genuine concern following a long period of separation. Distinct from the common usage of this phrase in English, where it often functions as a conversational norm, the Chinese version serves more as an expression of genuine concern and longing, marking the re-establishment of a connection after a period of separation. 

In the third conversation (@anthony) from _A Journey Through Time with Antony_, the two speakers reunited after a long separation across different countries. The second speaker's comment on the first speaker's greeting underscores the notable difference between the Chinese and English versions of this greeting. The Chinese version of "_How are you doing?_" is not a commonly used greeting and often implies more personalized concern and intimacy, which is the reason why the second speaker highlighted the first speaker's use of this greeting.
 
The close relationship between context and the usage of interrogative greetings resonates with the analysis of @曲卫国_2001. Due to the openness of the topic, Chinese greetings are highly context-dependent. Their specific usage is influenced by various pragmatic factors. Movie dialogue examples further highlight how the function and significance of interrogative greetings in Chinese are intricately linked with speakers' social dynamics and situational context. In contrast, non-interrogative greetings like "Hello!" are more impersonal and less reliant on context, hence emerging as a more prevalent form of greeting.

The evolving patterns of greetings mirror changes in contemporary Chinese society. These patterns, as seen in movie subtitles, align with findings from @XIA2023156's study. By examining classic Chinese literature, they observed a trend toward "impersonalization" in greetings between new acquaintances in the 20th century, both in topic selection and sentence structure. This trend is the most notable diachronic change in interrogative greetings, corresponding with their decline in our study. As the economy develops and the focus shifts away from basic survival, the frequency of traditional greetings like "吃了吗?(_Have you eaten?_)" decreases, as noted by @XIA2023156. In a more stable and fast-paced society, the prevalence of non-interrogative greetings like "你好!(_Hello!_)" increases. Technological advancements, especially the widespread use of social media and instant messaging, have also transformed communication. The platforms often encourage quicker and more straightforward interactions, possibly favoring more standardized greetings. As noted in the movie conversations (@anthony), the speakers get more used to impersonalized greetings like "_Hi_" and English-styled "_How are you doing?_" becomes a somehow quirky variation of greeting. 







= Conclusion 

In conclusion, this project has provided a comprehensive analysis of the evolution of Chinese greetings through a corpus and a set of movie subtitles, examining their transition from question forms like “你吃了吗?” (_Have you eaten?_) and “你好吗?” (_How are you?_) to non-interrogative expressions such as “你好!” (_Hello!_) and “早上好!” (_Good morning!_). Through an quantitative analysis of conversational corpora and movie subtitles, we have traced the diachronic changes in greeting practices and explored their sociocultural implications.

Our findings indicate a shift in greeting practices within Chinese society. The decline in the use of interrogative greetings and the rise of non-interrogative forms reflect broader sociocultural changes, including shifts towards greater impersonalization, and alterations in politeness norms. These trends mirror the ongoing transformations in Chinese social dynamics and cultural practices.





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
 
All the data, codes, and graphs used in this project can be found at the GitHub repository #link("https://github.com/li3zhen1/sociolinguistics-greeting-analysis")[sociolinguistics-greeting-analysis].


= Explanation of the Regular Expressions<regex-explain>

\

Constraints for avoiding surruounding Hanzi characters are omitted below. 


== Non-interrogative form: `(?<!\p{Han})(上午|下午|晚上|中午|早上)好[啊]?(?!\p{Han})` (_Good morning / evening / ... !_)

#box(stroke:0.5pt+black, inset: 1em, width: 100%)[

- `(上午|下午|晚上|中午|早上)`: matches either `上午` (shàngwǔ, _morning_), `下午` (xiàwǔ, _afternoon_), `晚上` (wǎnshàng, _evening_), `中午` (zhōngwǔ, _noon_), or `早上` (zǎoshàng, _early morning_).

- `好`: matches `好` (hǎo), which translates to _"good"_ or _"well"_ in English.
]
\


== Interrogative form: `(?<!\p{Han})(你|您)(最近)?好[吗么没嘛啊](?!\p{Han})`  (_How are you?_)


#box(stroke:0.5pt+black, inset: 1em, width: 100%)[

- `(你|您)`: matches either `你` (nǐ, _you_) or `您` (nín, formal _you_).

- `(最近)?`: matches one or zero times of `最近` (zuìjìn, _recently_).

- `好`: matches `好` (hǎo), which translates to _"good"_ or _"well"_ in English.

- `[吗么没嘛啊]`: matches either `吗` (ma, question particle), `么` (me, question particle), `没` (méi, negative particle), `嘛` (ma, modal particle), or `啊` (ā, an exclamation or modal particle used for emphasis or mood). In this greeting, they are used as modal particles.
]
\

== Interrogative form: `(?<!\p{Han})(你|您)?(已经)?吃[过]?[饭]?了[吗么没嘛啊](?!\p{Han})` (_Have you eaten?_)
#box(stroke:0.5pt+black, inset: 1em, width: 100%)[

- `(你|您)?`: matches `你` (nǐ, _you_), `您` (nín, formal _you_) or nothing.

- `(已经)?`: matches one or zero times of `已经` (yǐjīng, _already_).

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
  
  - The movie names are only fuzzy matched in the search box of SrtKu. Some manual work is needed to remove the wrong matches.

  - Due to limited time, the data cleaning process was conducted with a basic approach. This might have led to the inadvertent inclusion of some non-Chinese movies in the dataset.

+ Run `clean.ipynb` to clean the downloaded subtitles.

+ Run `encoding.ipynb` to convert the subtitles from `UTF-8 with BOM` / `GB2312` to `UTF-8` encoding.

\

= Analyzing Conversational Corpus and Movie Data

+ Run `count_regex.ipynb` to count the appearances of greetings in subtitles by regex matches.

  - Run `eda.ipynb` to aggregate the results.

  - Copy the generated `regex_sum.json` to `visualization.html` and open it in a browser to visualize the results.

+ Run `count_magic.ipynb` to count the appearances of greetings in the corpus by regex matches.

\

All subtitles can be found in the `caption` folder.

Results can be found in the root folder.