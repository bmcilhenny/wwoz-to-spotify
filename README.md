# WWOZ To Spotify
Goal is to eventually share endpoint to API I built from scraping WWOZ's XML with Nokogiri. Once deployed I will use that data to run scheduled tasks to update my Spotify playlist WWOZ via Spotify's API.

#### Technologies Used:
`Nokogiri, Rest Client, Ruby on Rails`

#### Hesitations
Was thinking about using's Ruby's Spotify client wrapper but like flexibility of writing my own queries. Might go back to it if I run into issues with OAuth. OAuth is required to write to my playlist (add songs to WWOZ playlist).


Sample of my scraped then constructed WWOZ endpoint: 
```
{
  "title": "Recent spins on WWOZ",
  "link": "http://spinitron.com//radio/playlist.php?station=wwoz",
  "description": "The most recent songs played on WWOZ and logged on Spinitron, WWOZ's playlist handling service provider.",
  "lastBuildDate": "Sun, 06 May 2018 01:32:52 -0500",
  "entries": [
    {
    "artist": "Meters",
    "song_title": "Zony Mash",
    "album": "Funkify Your Life- The Meters An",
    "played_at": "11:57pm CDT Sat May 5th 2018",
    "dj": "Awake and Willing with Peggy Lou"
    },
    {
    "artist": "BOBBY LOUNGE",
    "song_title": "i'll always be better than you",
    "album": "i remmeber the night youir trailer burned down",
    "played_at": "11:51pm CDT Sat May 5th 2018",
    "dj": "Awake and Willing with Peggy Lou"
    },
    {
    "artist": "Steve Riley",
    "song_title": "jamais une autre chance",
    "album": "best of",
    "played_at": "11:50pm CDT Sat May 5th 2018",
    "dj": "Awake and Willing with Peggy Lou"
    },
    {
    "artist": "Zion Harmonizers",
    "song_title": "- He Never Left Me",
    "album": "The Best of New Orleans Gospel,",
    "played_at": "11:49pm CDT Sat May 5th 2018",
    "dj": "Awake and Willing with Peggy Lou"
    }
  ]
}
```

