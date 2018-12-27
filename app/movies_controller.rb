
def can_be_instantiated_and_then_saved
  movie = Movie.new
  movie.title = "This is a title."
  movie.save
end

def can_be_created_with_a_hash_of_attributes
  attributes = {
      title: "The Sting",
      release_date: 1973,
      director: "George Roy Hill",
      lead: "Paul Newman",
      in_theaters: false
  }
  movie = Movie.create(attributes)
end

def can_be_created_in_a_block(title: "Home Alone", release_date: 1990)
  Movie.create do |m|
    m.title = title 
    m.release_date = release_date
  end
end

def can_get_the_first_item_in_the_database
  Movie.all[0]
end

def can_get_the_last_item_in_the_database
  Movie.all.reverse[0]
end

def can_get_size_of_the_database
  Movie.all.size
end

def can_find_the_first_item_from_the_database_using_id
  Movie.all[0]
end

def can_find_by_multiple_attributes
  Movie.find_by(title: "Title", release_date: 2000, director: "Me")
end

def can_find_using_where_clause_and_be_sorted
  x = (Movie.all.sort_by{ |movie| movie.release_date}).reverse
  y = []
  x.each do |movie| 
    if movie.release_date > 2002 
      y << movie 
    end 
  end 
  y
end

def can_be_found_updated_and_saved
  Movie.create(title: "Awesome Flick")
  x = Movie.find_by(title: "Awesome Flick")
  x.update(title: "Even Awesomer Flick")
  x 
end

def can_update_using_update_method
  # Update movie title to "Wat, huh?"
  x = Movie.create(title: "Wat?")
  x.update(title: "Wat, huh?")
  x
end

def can_update_multiple_items_at_once
  5.times do |i|
    Movie.create(title: "Movie_#{i}", release_date: 2000+i)
  end
  Movie.all.each do |movie| 
    movie.update(title: "A Movie")
  end 
end

def can_destroy_a_single_item
  x = Movie.create(title: "That One Where the Guy Kicks Another Guy Once")
  Movie.destroy(x.id)
end

def can_destroy_all_items_at_once
  10.times do |i|
    Movie.create(title: "Movie_#{i}")
  end
  Movie.destroy
end