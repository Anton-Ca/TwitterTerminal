# Author: Anton Carlsson
'''
/* --------------------------------- Purpose ------------------------------- */
This module lets the user read tweets and twitter replies directly in the terminal.
I have never personally used twitter, but sometimes I felt it would be nice to still
be able to follow a certain person. This is so far a very basic program that allows
the user to do just that, without ever leaving the terminal.

/* ---------------------------------- Usage -------------------------------- */
In the example below all tweets that Elon Musk posted the last 24h gets webscraped
using the BeatifulSoup library. Replace the URL with the profile you are intrested
in and for now the script only works with mobile version.
'''
from bs4 import BeautifulSoup
import requests

URL = 'https://mobile.twitter.com/elonmusk'
source = requests.get(URL).content
soup = BeautifulSoup(source, 'html.parser')
tweet_list = soup.findAll({'table'}, class_="tweet")
number_of_tweets = len(tweet_list)

def valid_time(time):
    '''Checks whether the time is within 24h.'''
    return not str.isupper(str(time[0]))


i = 0
while i < number_of_tweets:
    # Prints out the last X number of tweets of Elon Musk with timestamps,
    # where X = number_of_tweets.
    tweet = tweet_list[number_of_tweets - (i + 1)]
    timestamp = tweet.find('td', class_='timestamp')
    found_time = timestamp.find('a').text

    if valid_time(found_time):
        tweet_text = tweet.find(dir='ltr').text
        print("(" + str(number_of_tweets - i) + ") " + found_time)
        print(tweet_text)

    i += 1
