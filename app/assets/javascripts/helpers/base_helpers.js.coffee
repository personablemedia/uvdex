Handlebars.registerHelper('ifIsNthItem', (options) ->
  index = options.data.view.contentIndex + 1
  nth = options.hash.nth

  if (index % nth == 0)
    return options.fn(this)
)

Handlebars.registerHelper('ifStartOfRow', (options) ->
  index = options.data.view.contentIndex + 1
  cols = options.hash.cols

  if ((index - 1) % cols == 0 or index == 1)
    return options.fn(this)
)

Handlebars.registerHelper('ifEndOfRow', (options) ->
  index = options.data.view.contentIndex + 1
  cols = options.hash.cols

  if (index % cols == 0)
    return options.fn(this)
)

Ember.TextSupport.reopen(
  attributeBindings: ["required"]
)
