WordCtrls = angular.module("WordCtrls", [])

class WordsCtrl
  constructor: (@scope, @Word)->
    @greeting = "The Amazing Word App!!!"
    @characters = {}
    return this

  getWords: ->
    @Word.all().success (data)=>
      @wordArr = data

  addWord: (newWord)->
    @Word.create(newWord).success (data)->

  learnTrie: ->
    @Word.learn (word)->


WordCtrls.controller("WordsCtrl", ["$scope", "Word", WordsCtrl])

