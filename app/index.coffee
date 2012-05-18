require('lib/setup')

Spine = require('spine')

HomeController             = require('controllers/homeController')
HackShowController         = require('controllers/hackShowController')
# ParticipantsShowController = require('controllers/ParticipantsShowController')
NavigationController       = require('controllers/navigationController')

Hack  = require('models/hack')
Quote = require('models/quote')

class contentController extends Spine.Controller
  

  constructor:->
    super
    @append new HomeController()



class App extends Spine.Controller

  elements:
    "#hacksFull" : "hackdiv"

  events:
    "click .nav" : "scroll_to"

  constructor: ->
    super
    Hack.fetch()
    Quote.fetch()
    @prepend new NavigationController()
    new contentController({el: $("#content")})
    console.log @hackdiv

    for hack in Hack.all()
      @hackdiv.append (new HackShowController(hack: hack)).el
    
    @append require("/views/footer")()

  scroll_to : (event)=>
    event.preventDefault()
    ele = $(event.target).attr("href")
    console.log("ele", ele)
    $('html, body').animate({scrollTop: ($(ele).offset().top )}, 600)

module.exports = App