Spine = require('spine')


class Hack extends Spine.Model
  @configure 'Hack', "name", "creators","mainImage", "about", "resources", "media", "url", "sourceCode", "thumb"
 
  @fetch:->
    for hack in require("/lib/Hacks")
      Hack.create require("/lib/hacks/#{hack}")

  slug:=>
    @name.replace(/\s/g,"_")

  @findBySlug:(slug)->
    @select (h)=>
      h.slug() == slug 

module.exports = Hack