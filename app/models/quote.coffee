Spine = require('spine')


class Quote extends Spine.Model
  @configure 'Quote', "person", "quote"

  @fetch:->
    for quote in require("/lib/Quotes")
      Quote.create(quote)

  @random:=>
    @all()[Math.floor(@count()*Math.random())]

module.exports = Quote