#!/bin/sh
API_KEY="AIzaSyD-tCpwUbRNy57XrpDR7BW-Azc5qcvlrFc"
id_video="4ExwNEWXz38"

curl "https://www.googleapis.com/youtube/v3/videos?id=$id_video&key=$API_KEY&part=snippet,contentDetails,statistics,status"





