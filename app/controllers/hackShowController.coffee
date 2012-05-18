Spine = require('spine')
Hack  = require('models/hack')

class HackShowController extends Spine.Controller
  className: "hackShow"
  constructor:->
    super
    @el.attr("id",@hack.slug())
    @render()

  render:=>
    @html require('/views/hackShow')(@hack)
  

module.exports = HackShowController