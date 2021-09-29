# 0x16. API advanced

- [Reddit API Documentation](https://www.reddit.com/dev/api/)
- [Query String](https://en.wikipedia.org/wiki/Query_string)


## Tasks
## 0. How many subs?
Write a function that queries the `Reddit API` and returns the number of `subscribers` for a given subreddit. If an `invalid` subreddit is given, the function should return `0`.

- If you’re getting errors related to Too Many Requests, ensure you’re setting a custom User-Agent.
- Prototype: `def number_of_subscribers(subreddit)`
**NOTE:** Invalid subreddits may return a redirect to search results. Ensure that you are not following redirects.

```python
# 0-main.py
#!/usr/bin/python3
"""
0-main
"""
import sys

if __name__ == '__main__':
    number_of_subscribers = __import__('0-subs').number_of_subscribers
    if len(sys.argv) < 2:
        print("Please pass an argument for the subreddit to search.")
    else:
        print("{:d}".format(number_of_subscribers(sys.argv[1])))
```

```bash
$ python3 0-main.py programming
756024
$ python3 0-main.py this_is_a_fake_subreddit
0
```

`File:` [0-subs.py](0-subs.py)


## 1. Top Ten
Write a function that queries the `Reddit API` and prints the `titles` of the `first 10 hot posts` listed for a given subreddit.

- Prototype: `def top_ten(subreddit)`
- If `not a valid` subreddit, print `None`.
**NOTE:** Invalid subreddits may return a redirect to search results. Ensure that you are not following redirects.

```python
# 1-main.py
#!/usr/bin/python3
"""
1-main
"""
import sys

if __name__ == '__main__':
    top_ten = __import__('1-top_ten').top_ten
    if len(sys.argv) < 2:
        print("Please pass an argument for the subreddit to search.")
    else:
        top_ten(sys.argv[1])
```

```bash
$ python3 1-main.py programming
Firebase founder's response to last week's "Firebase Costs increased by 7000%!"
How a 64k intro is made
HTTPS on Stack Overflow: The End of a Long Road
Spend effort on your Git commits
It's a few years old, but I just discovered this incredibly impressive video of researchers reconstructing sounds from video information alone
From the D Blog: Introspection, Introspection Everywhere
Do MVC like it’s 1979
GitHub is moving to GraphQL for v4 of their API (v3 was a REST API)
Google Bug Bounty - The 5k Error Page
PyCon 2017 Talk Videos
$ python3 1-main.py this_is_a_fake_subreddit
None
$
```

`File:` [1-top_ten.py](1-top_ten.py)


## 2. Recurse it!
Write a recursive function that queries the `Reddit API` and returns a list containing the `titles` of `all hot articles` for a given subreddit. If `no results` are found for the given subreddit, the function should return `None`.

**Hint:** The Reddit API uses pagination for separating pages of responses.

- Prototype: `def recurse(subreddit, hot_list=[])`
- If `not a valid` subreddit, return `None`.
**NOTE:** Invalid subreddits may return a redirect to search results. Ensure that you are not following redirects.

```python
# 2-main.py
#!/usr/bin/python3
"""
2-main
"""
import sys

if __name__ == '__main__':
    recurse = __import__('2-recurse').recurse
    if len(sys.argv) < 2:
        print("Please pass an argument for the subreddit to search.")
    else:
        result = recurse(sys.argv[1])
        if result is not None:
            print(len(result))
        else:
            print("None")
```

```bash
$ python3 2-main.py programming
932
$ python3 2-main.py this_is_a_fake_subreddit
None
```

`File:` [2-recurse.py](2-recurse.py)


## 3. Count it!
Write a recursive function that queries the `Reddit API`, parses the `title of all hot articles`, and prints a `sorted count` of given `keywords` **(case-insensitive, delimited by spaces. Javascript should count as javascript, but java should not)**.

- Prototype: `def count_words(subreddit, word_list)`
**Note:** You may change the prototype, but it must be able to be called with just a subreddit supplied and a list of keywords.
- If `word_list` contains the `same word` **(case-insensitive)**, the `final count` should be the `sum of each duplicate` **(example below with java)**
- Results should be printed in `descending order`, `by the count`, and if the count is the same for separate `keywords`, they should then be sorted alphabetically **(ascending, from A to Z)**. Words with no matches should be skipped and not printed. -Words must be printed in lowercase.
- Results are based on the number of times a keyword appears, not titles it appears in. `java java java` counts as 3 separate occurrences of `java.`
- To make life easier, `java.` or `java!` or `java_` should not count as `java`
- If no posts match or the subreddit is invalid, print nothing.
**NOTE:** Invalid subreddits may return a redirect to search results. Ensure that you are NOT following redirects.

```python
# 100-main.py
#!/usr/bin/python3
"""
100-main
"""
import sys

if __name__ == '__main__':
    count_words = __import__('100-count').count_words
    if len(sys.argv) < 3:
        print("Usage: {} <subreddit> <list of keywords>".format(sys.argv[0]))
        print("Ex: {} programming 'python java javascript'".format(sys.argv[0]))
    else:
        result = count_words(sys.argv[1], [x for x in sys.argv[2].split()])
```

```bash
$ python3 100-main.py programming 'react python java javascript scala no_results_for_this_one'
java: 27
javascript: 20
python: 17
react: 17
scala: 4
$ python3 100-main.py programming 'JavA java'
java: 54
$ python3 100-main.py not_a_valid_subreddit 'python java javascript scala no_results_for_this_one'
$ python3 100-main.py not_a_valid_subreddit 'python java'
$
```

`File:` [100-count.py](100-count.py)
