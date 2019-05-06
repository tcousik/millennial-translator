class User_Favorites
  attr_reader :name
  attr_accessor :favorite_words

  @@all = []

  def initialize(word, name)
    @name = name
    @favorite_words = []
    @favorite_words << word
    @@all << self
  end

  def self.all
    @@all
  end

  def self.has_fav(name)
    self.all.find do |user_favorites|
      name == user_favorites.name
    end
  end


  def self.new_favorite(word, name)

    if self.has_fav(name) == nil
      self.new(word, name)
      puts "Here are your favorite words"
      puts self.has_fav(name).favorite_words
      mta_step_one(name)
      #return fav list
    else
      #add and return the faves list
      #create a method to check to see if the word exists fist before adding
      self.has_fav(name).favorite_words << word

      puts "Here are your favorite words"
      puts self.has_fav(name).favorite_words
      mta_step_one(name)
    end
  end

  def self.user_fav_list(name)
    puts "Here are your favorite words"

    if self.has_fav(name) == nil #if a user doesnt have a fav list yet, tell them
      puts "You haven't added any favorites yet"
      mta_step_one(name)
    else #if the user does have a fav list, return it
      puts self.has_fav(name).favorite_words
      mta_step_one(name)
    end
  end

end
