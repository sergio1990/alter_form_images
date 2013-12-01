#= require holder
#= require preimage

(($, window) ->

  # Define the plugin class
  class AlterFormImages

    defaults:
      paramA: 'foo'
      paramB: 'bar'

    constructor: (el, options) ->
      @options = $.extend({}, @defaults, options)
      @$el = $(el)
      @$el.find(".alter-image-input").preimage()
      $("img", @$el).click (e) ->
#        e.stopPropagation()
        e.stopImmediatePropagation()
        $(@).parents(".alter-image-block").find('.alter-image-input').trigger('click')
        return false

  # Define the plugin
  $.fn.extend AlterFormImages: (option, args...) ->
    @each ->
      $this = $(this)
      data = $this.data('AlterFormImages')

      if !data
        $this.data 'AlterFormImages', (data = new AlterFormImages(this, option))
      if typeof option == 'string'
        data[option].apply(data, args)

) window.jQuery, window

$ ->
  $(".alter-image-block").AlterFormImages()
  return