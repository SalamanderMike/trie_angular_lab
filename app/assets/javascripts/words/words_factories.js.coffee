WordFactories = angular.module("WordFactories", [])


WordFactories.factory("Word", ["$http", ($http)->
  return {
    all: ()->
      $http.get("/words.json").success (data)->
    ,
    create: (newWord)->
      $http.post("/words.json", {words: newWord})
    # ,
    # WordsCtrl::learn = (word, index)->
    #   index = 0  if index is `undefined`
    #   if index is word.length
    #     @isWord = true
    #   else if index < word.length
    #     thisNode = word[index]
    #     subTrie = @characters[thisNode] or new WordsCtrl()
    #     subTrie.learn word, index + 1
    #     @characters[thisNode] = subTrie
    #   console.log this
    #   this


  }
])

