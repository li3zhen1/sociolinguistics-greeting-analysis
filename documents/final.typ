#set page(
  numbering: "1/1",
  paper: "us-letter",
  margin: 0.85in,
)

#set text(
  font: ("New York Small", "Noto Serif SC") 
)

#set cite(
  style: "american-psychological-association"
)


= #text(weight: 500, size: 16pt)[A Comparative Study of Chinese and English Greetings: "#text(weight: 600, size: 16pt)[你吃了吗？]", "#text(weight: 600, size: 16pt)[你好吗？]" and "How are you doing?"]


#set heading(
  numbering: "1.1"
)

#set par(
  leading: 6pt,
)

#v(14pt)
Zhen Li

#show heading.where(level: 1): (it) => {
  text(weight: 500, size: 14pt)[#it]
  v(3pt)
}

#show heading.where(level: 2): (it) => {
  text(weight: 500)[#it]
  v(3pt)
}


= Introduction
Questions are not commonly used in greetings between Chinese (especially strangers), but very common in US. The questions “你吃了吗?(nǐ chī le mā? Have you eaten?)” and “你好吗? (nǐ hǎo mā? How are you?)” are often compared to “How are you doing?” but is it really the case? This paper will compare the usage of the three questions in Chinese and English greetings and find out the similarities and differences between them.

= Literature Review 

@XIA2023156

@gumperz2015interactional 

- It introduced the topic of "Interactional Sociolinguistics", which studies how people use language in everyday conversations, focusing on their intentions and cultural backgrounds.

- It also analyzes conversations as sequences of speaking turns, emphasizing the role of context in understanding what is being communicated.

@Boxer_2002 
- It explores how people communicate in different areas of life like family, work, and social settings, focusing on methods like conversation analysis.

- It includes original analyses on topics like nagging in families and bragging at work, showing how people interact in various situations.


@Duranti_1997 

- The paper proposes six criteria to analyze greetings across languages.

- Suggests that greetings can have substantive content and social purposes.

#pagebreak()
 
@Liu_2016 
- It compares greetings in English and Chinese, highlighting their significant role in social identity and cross-cultural communication.


@Juliane_2021 
- The paper presents a framework for analyzing how conventional expressions relate to speech acts in English and Chinese.

- It shows that the daily expressions like "Thank" and "Greet" often serve purposes beyond their typical speech act association, and introduces a categorization system to analyze these alternative uses.

@House_2022 
- This paper explores the complexities of greeting in English compared to Chinese, addressing why Chinese learners of English find English greetings puzzling.
- It included 2 interesting studies, analyzing corpora for pragmatic differences and similarities in greetings, and collecting data from English and Chinese speakers to observe their greeting behavior in various contexts. 

- The study tries to clarify why some English learners struggle with greeting conventions.

@Bobgan_2000 
- It explores how age and gender affect responses to "How are you doing?" and the use of "good" as an adverb.



@曲卫国_2001 

- The paper defines greetings in Chinese and analyzes them from the perspectives of linguistic form, topic, and pragmatic constraints. It proposes three main characteristics of Chinese greetings: openness of topics, convertibility, and diversity in sentence patterns. 

- It also compares Chinese greetings and English greetings in semantics and pragmatics, showing that Chinese greetings are more open and flexible than English greetings. 



= Data and Methodology 

== Greetings

== Previous Research on Chinese Greetings 




= Result and Discussion  

= Conclusion 



#pagebreak()
#bibliography("./main.bib", style: "american-psychological-association") 


#set heading(
  numbering: none
)

#pagebreak()
= Appendix

== Data Crawling Scripts



== Data Result