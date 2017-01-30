class @JqueryWatcher
  @observer: new JqueryDOMObserver

  @watch: (selector, callback) ->
    id = Math.floor(Math.random() * 10000000000000001)

    register = (element) ->
      return if element.data('jquery-watcher-id-' + id + '-watching') == 'true'

      element.data(('jquery-watcher-id-' + id + '-watching'), 'true')

      callback(element)

    $(document).ready ->
      register($(selector))

    document.addEventListener 'turbolinks:load', ->
      register($(selector))

    this.observer.add selector, (node) ->
      element = $(node)

      register(element)


jQuery['watch'] = (selector, callback) ->
  JqueryWatcher.watch(selector, callback)
