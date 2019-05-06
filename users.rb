#users are able to store favorite words they have queried.


class User
  attr_accessor :name

  @@all =[]   #need to have this writing to the user table

  def initialize (name)
    @name = name
    @@all << self
  end

  def self.all   #return all known users users
    @@all
  end

  def self.find_user(name) # checks to see if the user has been here before
    self.all.find do |user|
      user.name == name
    end
  end



end
