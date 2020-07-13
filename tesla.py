from bs4 import BeautifulSoup
import requests

source = requests.get('https://mobile.twitter.com/elonmusk').content
soup = BeautifulSoup(source, 'html.parser')
tweet_list = soup.findAll({'table'}, class_="tweet")
number_of_tweets = len(tweet_list)

i = 0
# Prints out the last X number of tweets of Elon Musk with timestamps, where X = number_of_tweets
while i < number_of_tweets:
    tweet = tweet_list[number_of_tweets - (i + 1)]
    timestamp = tweet.find('td', class_='timestamp')
    time = timestamp.find('a').text

    # The Lambda is a function that checks if the time string starts with a capital letter. This lets us check whether the tweet was posted less than 24 hours ago in which case we would like to proceed with the below. 
    if lambda time: not str.isupper(str(time[0])):
        tweet_text = tweet.find(dir='ltr').text
        print("(" + str(number_of_tweets - i) + ") " + time)
        print(tweet_text)

    i += 1
