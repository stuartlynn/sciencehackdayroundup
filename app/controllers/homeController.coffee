Spine = require('spine')
Hack = require('models/hack')
Quote = require('models/quote')

class HomeController extends Spine.Controller

  className: "homeController"

  elements: 
    "#hacks" : "hacks"
    "#quotes" : "quotes"

  constructor: ->
    super
    @render()
    
  render:=>
    @html require("views/home")()
    @hacks.html require("views/hackTab")(Hack.all())
    # @quotes.html require("views/quotes")([Quote.random(),Quote.random()] )

module.exports = HomeController