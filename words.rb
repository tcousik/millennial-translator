#class words  querys the definition database for the word.
#takes the row of information and creates a word object
#returns and displays the word object

class Word

  attr_accessor :word, :meaning

  @@all = []

  def initialize(word, meaning)
    @word = word
    @meaning = meaning

    @@all << self
  end

  def self.all
    @@all
  end

  def self.defined?(word)  #is the word defined?
    self.all.select do |definition|
      word == definition.word
    end
  end


end
