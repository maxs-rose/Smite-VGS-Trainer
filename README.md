# README

This a small web app that designed to help you get better at use the VGS system in smite!

A live version of the program can be found [here](http://www.smitevgstrainer.com/) or [here](https://floating-castle-04251.herokuapp.com/).


API
 - /challenge : GET : Will return a random vgs in format { "combo": "vvgg", "value": "Good Game!"}
 - /search?data= : GET :  Will return next level of VGS options 
 - /vgs : GET: Will return all objects as json in format [ { "combo": "vvgg", "final": true, "value": "Good Game!"}, { "combo": "vvgg", "value": "Good Game!"} ]