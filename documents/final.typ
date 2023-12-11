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
  v(8pt)
  text(weight: 500, size: 14pt)[#it]
  v(4pt)
}

#show heading.where(level: 2): (it) => {

  v(6pt)
  text(weight: 500)[#it]
  v(3pt)
}

#show cite: it => {
  text(fill: rgb(24, 118, 153))[#it]
}


= Introduction

Greetings are a type of speech act that serves to establish and maintain social relationships. They are a fundamental part of everyday communication, and their usage and form are influenced by social and cultural factors. This project investigates the evolving nature of Chinese greetings, focusing on the use of question forms like “你吃了吗?” (_Have you eaten?_) and “你好吗?” (_How are you?_), compared to non-question forms, “你好!” (_Hello!_) and “早上好!” (_Good morning!_). Contrary to the common comparison with “How are you doing?” in English, such question forms are less prevalent in Chinese greetings, especially among strangers. 

By analyzing a conversational corpus alongside movie subtitles crawled from a Chinese movie resource website, we aim to understand how these greetings have changed over time and what these changes reveal about Chinese society and culture. This examination can be part of a broader inquiry into the nature of language as an evolving entity that mirrors social dynamics. In addition to a statistical approach, we also attempt to delve into the pragmatics and sociocultural significance of these greetings, contributing to our understanding of language's role in reflecting and influencing social interactions.

= Literature Review 

== Greetings

@Duranti_1997 proposed a operational definition for analyzing greetings across languages and the relationships between conventional expressions. Duranti's six criteria for alternative uses of daily expressions like greetings are instrumental in understanding the substantive and social purposes of these linguistic interactions. 

@gumperz2015interactional and @Boxer_2002 delve into the broader field of sociolinguistics and interactional studies, providing foundational concepts and methodologies such as interactional sociolinguistics and conversation analysis that are essential for analyzing greeting behaviors in different social settings.


== Previous Research on Chinese Greetings 


@XIA2023156's study provides a historical context, tracing the evolution of greeting culture in China from the 17th to the 20th century. It reveals a shift towards impersonalization in greetings, increased semantic informativeness, and a departure from traditional politeness norms of self-denigration and other-elevation. This historical perspective is crucial for understanding the current state of Chinese greeting practices.


@Liu_2016 and @House_2022 focus specifically on the comparison between English and Chinese greetings. Liu underscores the significance of greetings in social identity and cross-cultural communication, while House addresses the challenges Chinese learners of English face due to pragmatic differences in greeting conventions. House's inclusion of empirical studies adds depth to our understanding of these challenges.

@Bobgan_2000 and @曲卫国_2001 contribute to the understanding of demographic and linguistic specifics. Bobgan explores the influence of age and gender on responses to greetings in English, while 曲卫国 offers a detailed analysis of the linguistic form, topic, and pragmatic constraints of Chinese greetings, highlighting their openness, convertibility, and diversity.

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


In this study, we intend to extract the greetings from the coversation a corpus and movie subtitles and count their frequency.

The corpus MAGICDATA Mandarin Chinese Conversational Speech Corpus includes 180 hours of Mandarin Chinese speech from 633 speakers. All the transcripts are combined into a #link("https://github.com/li3zhen1/sociolinguistics-greeting-analysis/blob/main/mandarin_conversation/mandarin_conversational_corpus_combined_scripts.txt")[219,325 line file] for further analysis.

The movie subtitles are crawled from #link("https://srtku.com")[Srtku]. We use the movie lists from #link("https://movie.douban.com/explore")[Douban], an online movie database that provides rich filters for movie search. This website provides recommendations for movies from different decades, which enabled us to perform a diachronic analysis over a representative set of movies. For each decade from 1960s to 2020s, we select the recommended 200\~300 movies and download their subtitles from Srtku. After cleaning, the final dataset contains 828 readable movies subtitles in total:

#figure(
  table(
    columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
    [1960s], [1970s], [1980s], [1990s], [2000s], [2010s], [2020s],
    [40], [102], [202], [173], [91], [143], [77],
  ),
  caption: "Number of movies for each decade",
)


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

), 

caption: "Regular expressions for matching greetings",

)<RegTable>
\
\ Take the first regular expression as an example, there are 5 major parts:

#box(stroke: 0.5pt+black, inset: 1em, width: 100%)[
+ `(?<!\p{Han})`: matches the position where the previous character is not a Hanzi character. The `\p{Han}` represents any character in the Unicode Han script.
+ `(你|您)`: matches either `你` (nǐ, _you_) or `您` (nín, formal _you_).
+ `好`: matches `好` (hǎo), which translates to _"good"_ or _"well"_ in English.
+ `[啊]?`: matches one or zero times of `啊` (ā, an exclamation or modal particle used for emphasis or mood).
+ `(?!\p{Han})`: matches the position where the next character is not a Hanzi character.
]

The leading and trailing `(?<!\p{Han})` and `(?!\p{Han})` are used to avoid disambiguation from the sentences like "*你好*棒" (_You are so amazing_). We don't force the last one `吃[过]?[饭]?了[吗么没嘛啊]` to have a leading non-Hanzi character because there exist several variations with different leading texts, such as "你已经吃过饭了吗?" (_Have you already eaten?_), and it's probably sufficient to match the similar semantics with the trailing constraint only. 

Detailed explanation for other 3 regular expressions can be found in @regex-explain.


 

= Result and Discussion  

#figure(
  {

    image("visualization.svg")
 
  },
  caption: "Changes of the frequency of greetings in the movie subtitles from 1960s to 2020s",
)
 

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

#set heading(
  numbering: "A.1"
)

== Explanation of the Regular Expressions<regex-explain>

Full width puctuations, such as `。` and `？`, are not matched by `\p{Han}`.


All the code and data used in this project can be found at the repository #link("https://github.com/li3zhen1/sociolinguistics-greeting-analysis")[sociolinguistics-greeting-analysis].

== Obtaining and Analyzing Movie Subtitle Data

+ Collect the movie names from #link("https://movie.douban.com/explore")[Douban Explore] to filter the movies. Paste the #link("https://github.com/li3zhen1/sociolinguistics-greeting-analysis/blob/main/captions/script.js")[scripts] in the browser console and it will automatically click the expand button for 10 times and print 200 \~ 300 movie names in the console.

+ Run `movie_caption_crawl.ipynb` to crawl the movie subtitles. Switch IP if blocked by the website.
  
  - The movie names are only fuzzy matched in the search box of zimuku.net. Some manual work is needed to remove the wrong matches.

+ Run `clean.ipynb` to clean the downloaded subtitles.

+ Run `encoding.ipynb` to convert the subtitles from `UTF-8 with BOM` / `GB2312` to `UTF-8` encoding.

+ Run `stat.ipynb` to count the frequency of greetings by regex matches in the subtitles.

+ Run `eda.ipynb` to aggregate the results.

+ Copy the generated `regex_sum.json` to `visualization.html` and open it in a browser to visualize the results.


== Data Result