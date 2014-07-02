#= require jquery
#= require handlebars
#= require ember
#= require ember-data
#= require jquery.truncate
#= require jquery.royalslider.min
#= require_self
#= require uvdlib
#= require uvd_v1

# for more details see: http://emberjs.com/guides/application/
window.UvdV1 = Ember.Application.create()

DS.ActiveModelAdapter.reopen(
  namespace: 'api/v1'
)

UvdV1.ApplicationAdapter = DS.ActiveModelAdapter
