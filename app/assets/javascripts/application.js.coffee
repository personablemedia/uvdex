#= require jquery
#= require handlebars
#= require ember
#= require ember-data
#= require jquery.truncate
#= require jquery.royalslider.min
#= require uvdlib
#= require ./store
#= require_tree ./models
#= require_tree ./controllers
#= require_tree ./views
#= require_tree ./helpers
#= require_tree ./components
#= require_tree ./templates
#= require_tree ./routes
#= require ./router
#= require_self

# for more details see: http://emberjs.com/guides/application/
window.UvdV1 = Ember.Application.create()

DS.ActiveModelAdapter.reopen(
  namespace: 'api/v1'
)

UvdV1.ApplicationAdapter = DS.ActiveModelAdapter
