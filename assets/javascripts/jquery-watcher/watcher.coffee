class @JqueryWatcher
  observer: new JqueryDOMObserver

  add: (selector, callback) ->
    id = Math.floor(Math.random() * 10000000000000001)

    register = (element) ->
      return unless element.length
      return if element.data('jquery-watcher-id-' + id + '-watching') == 'true'

      element.data(('jquery-watcher-id-' + id + '-watching'), 'true')

      $.each element, (i, e) ->
        elem = $(e)

        if elem.length
          callback(elem)

    $(document).ready ->
      $(selector).each ->
        register($(this))

    document.addEventListener 'turbolinks:load', ->
      $(selector).each ->
        register($(this))

    this.observer.add selector, (node) ->
      register($(node))


jQuery['watcher'] = new JqueryWatcher
