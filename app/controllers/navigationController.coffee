Spine = require('spine')

class NavigationController extends Spine.Controller
  tag : "header"

  events: 
    "click #navButtons a" : "navChange"

  constructor: ->
    super
    @render()

  render:=>
    @html require('/views/nav')()

  navChange:(e)=>
    $("#navButtons a").removeClass(".selected")
    $(e.currentTarget).addClass(".selected")

module.exports = NavigationController