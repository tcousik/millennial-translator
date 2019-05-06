require "pry"

#I need to pass name into all the methods or set as global variable

#change .new to create with a empty fav word array
#change the empty array to say that there isnt any fav words yet


def mta_hello
  puts "Hello, welcome to the Millenial Translation Service.  Please enter your name"

  name = gets.chomp
  # take the name and search to see if they have an account
  if User.find_user(name).class == User #if returning user, display options, User.find_user returns the object if found
    puts "Welcome back #{name}"
    mta_step_one(name)
  else  #if the user is new, create a new user
    puts "This is the first time we have seen you #{name}, let's show you around"
    User.new(name)
    new_user_orientation(name)
  end
end

def mta_step_one(name) #This is the 'main menu' the screen to return
  puts "1 - Search for new word"
  puts "2 - Show favorite words"
  puts "3 - Exit"

  select = gets.chomp

  case select
    when "1"    #Chomp returns a string!!!
      # new word search
      puts "Please enter word to search"
      word = gets.chomp  #make everything lowercase to avoid search issues ?
      word_search(word, name) #method that searches the dictionary

    when "2"
      # find and return favorite word list for user
      puts "Here is a list of your favorite saved words"
      User_Favorites.user_fav_list(name)
      # create a method that seaches the user_words table and returns the saved words

    when "3"
      # exit
      puts "Y'all come back now ya hear!!!"

    else
      puts "Sorry I didn't get that, Can you try again?"
    end
end

def mta_step_two(word, name)
  puts "1 - Search for new word"
  puts "2 - Show favorite words"
  puts "3 - Add #{word} to favorite words"
  puts "4 - Exit"

  select = gets.chomp

  case select
    when "1" #Chomp returns a string!!!
      # new word search
      puts "Please enter word to search"
      word = gets.chomp  #make everything lowercase to avoid search issues ?
      word_search(word) #method that searches the dictionary

    when "2"
      # find and return favorite word list for user
      puts "Here is a list of your favorite saved words"
      User_Favorites.user_fav_list(name)
      # create a method that seaches the user_words table and returns the saved words
      # User_Favorites.new_favorite

    when "3"  #add the word to the favorites table and return the favorites
      puts "Adding #{word} to your favorites"
      sleep 1 #wait 1 second
      User_Favorites.new_favorite(word, name)

    when "4"
      # exit
      puts "Y'all come back now ya hear!!!"

    else
      puts "Sorry I didn't get that, Can you try again?"
    end

end


def word_search(word, name)   #Is the word in the dictionary
                        #if yes, return the def and ask if store it
                        #if no, ask for another input


  if Word.defined?(word)
    puts "#{word} means #{Word.defined?(word)[0].meaning}"
    mta_step_two(word, name)

      #This is a puts sting that returns the meaning.  The [0] is due to the array it is returning
  else
    puts "I dont seem to know that one either. Sorry"
    mta_step_one(word, name)
  end
end

#only used once, when a new user uses it for the fist time
def new_user_orientation(name)
  puts "This is a text dictionary with simple commands"
  puts "When selecting commands input the command number"
  puts "When searching for a word limit to just the word"
  puts "Now that we have you signed up we can keep track"
  puts "of your favorite words.  (limit 10 words)"

  puts "1 - Search for new word"
  puts "2 - Exit"

  select = gets.chomp

  case select
    when "1"    #Chomp returns a string!!!
      # new word search
      puts "Please enter word to search"
      word = gets.chomp  #make everything lowercase to avoid search issues ?
      word_search(word, name) #method that searches the dictionary

    when "2"
      # exit
      puts "Y'all come back now ya hear!!!"

    else
      puts "Sorry I didn't get that, Can you try again?"
  end

end
