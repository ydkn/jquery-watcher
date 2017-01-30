# This code was adapted from:
# https://jsfiddle.net/javan/rxyd0tts/ which was discussed here:
# https://github.com/turbolinks/turbolinks/issues/159

class @JqueryDOMObserver
  constructor: ->
    @selectors = {}
    @observer  = new MutationObserver(@processMutations)

    @observer.observe(document, childList: true, subtree: true, attributes: true)

  add: (selector, callback) ->
    @selectors[selector] ?= []
    @selectors[selector].push(callback)

  processMutations: (mutations) =>
    elements = new Set

    for mutation in mutations
      switch mutation.type
        when 'childList'
          for node in mutation.addedNodes when node.nodeType is Node.ELEMENT_NODE
            elements.add(node)
        when 'attributes'
          elements.add(mutation.target)

    elements.forEach(@processElement)

  processElement: (element) =>
    for selector, callbacks of @selectors
      for matchingElement in @findMatchingElements(element, selector)
        for callback in callbacks
          callback(matchingElement)

  findMatchingElements: (element, selector) ->
    elements = []
    elements.push(element) if matches(element, selector)
    elements.concat(element.querySelectorAll(selector)...)

  matches = do ->
    element = document.documentElement
    method  = element.matches ?
      element.matchesSelector ?
      element.webkitMatchesSelector ?
      element.mozMatchesSelector ?
      element.msMatchesSelector

    (element, selector) ->
      method.call(element, selector)
