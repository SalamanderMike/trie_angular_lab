Trie = function(){
  this.characters = {};
};

Trie.prototype.learn = function(word, index){
  if (index === undefined) index = 0;// Setup index

  if(index === word.length){        // end of word reached
    this.isWord = true;
  } else if (index < word.length){
      var thisNode = word[index];
      var subTrie = this.characters[thisNode] || new Trie();//create new Trie
      subTrie.learn(word, index+1);  //recursive call w/incr index
      this.characters[thisNode] = subTrie;
    }
    return this;
  };

Trie.prototype.getWords = function(words, currentWord){
  words = words || [];
  currentWord = currentWord || "";

  if (this.isWord) {
    words.push(currentWord);
  }
  for (var letter in this.characters){
    var nextWord = currentWord  + letter;
    this.characters[letter].getWords(words, nextWord);
  }
  return words;
};

Trie.prototype.find = function(word, index){
  if (index === undefined) index = 0;
  var thisNode = word[index];
  var parentTrie = this.characters[thisNode];

    if (index < word.length-1 && parentTrie){
      return parentTrie.find(word, index+1);
      }
    else {
      return parentTrie;
    }
};

Trie.prototype.autoComplete = function(prefix){
  var allWords = this.find(prefix);

  if (allWords){
    return allWords.getWords([], prefix);
  } else {
    return [];
  }
};

try{
  module.exports = Trie;
} catch(e){}

