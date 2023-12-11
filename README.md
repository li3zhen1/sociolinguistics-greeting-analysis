# sociolinguistics-greeting-analysis



## Obtaining and Analyzing Movie Subtitle Data

+ Run `pip3 install -r requirements.txt` to install the dependencies.

+ Run `movie_caption_crawl.ipynb` to crawl the movie subtitles. Switch IP if blocked by the website.

+ Run `clean.ipynb` to clean the downloaded subtitles.

+ Run `encoding.ipynb` to convert the subtitles from `UTF-8 with BOM` / `GB2312` to `UTF-8` encoding.

+ Run `stat.ipynb` to count the frequency of greetings by regex matches in the subtitles.

+ Run `eda.ipynb` to aggregate the results.

+ Copy the saved `regex_sum.json` to `visualization.html` and open it in a browser to visualize the results.
