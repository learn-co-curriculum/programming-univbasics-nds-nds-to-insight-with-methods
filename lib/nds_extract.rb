require 'directors_database'
# Call the method directors_database to retrieve the NDS

def directors_totals
  # Write this out as a nested series of whiles
end

def worldwide_gross_for_directors(nds)
  # Write a method that loops through the collection of directors and builds a
  # total of all their movies' worldwide grosses. This method should call
  # gross_for_director to do the "totalling" work.
end

def gross_for_director(nds, director_name)
  # Write a method that, given an NDS and a directors name returns the totals
  # of that directors movies based on summing an AoH where each Hash has a key
  # :worldwide_gross
  #
  # Hint:
  # * Find the right director
  # * Once found, iterate the director's movies and total up their gross
end
