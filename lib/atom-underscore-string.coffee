{CompositeDisposable} = require 'atom'

module.exports = AtomUnderscoreString =
  subscriptions: null
  uDasherize: null

  activate: (state) ->
    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable
    @uDasherize = require 'underscore.string/dasherize'
    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'atom-underscore-string:dasherize': => @dasherize()

  deactivate: ->
    @subscriptions.dispose()

  dasherize: ->
    editor = atom.workspace.getActivePaneItem()
    editor.insertText(@uDasherize('Hello, World!'))
