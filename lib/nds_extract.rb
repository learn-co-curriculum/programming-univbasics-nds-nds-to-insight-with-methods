require 'directors_database'
# Call the method directors_database to retrieve the NDS

def directors_totals
  directors_database.reduce({}) do |memo, d|
    memo[d[:name]] = gross_for_director(d)
    memo
  end
end

#def worldwide_gross_for_directors(nds)
#end

def gross_for_director(d)
  d[:movies].reduce(0){ |dir_total, m| dir_total += m[:worldwide_gross]; dir_total }
end
