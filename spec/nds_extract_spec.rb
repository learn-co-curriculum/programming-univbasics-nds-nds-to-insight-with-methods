require 'spec_helper'


#describe 'gross_for_director method' do
  #it "correctly totals the worldwide earnings for a director" do
    #first_director_name = directors_database.first.values.first
    #expect(gross_for_director(directors_database, first_director_name)).to eq(1357566430)
  #end
#end

#describe 'worldwide_gross_for_directors method' do
  #it "correctly totals the worldwide earnings of all the directors' movies" do
    #expect(worldwide_gross_for_directors(directors_database)).to eq(10355501925)
  #end
#end
describe 'The directors_database method can be processed by the directors_totals method' do

  it 'which returns a Hash describing director to total' do
    expect(directors_totals).to be_a(Hash)
  end

  describe "and correctly totals the directors' totals" do
    let(:expected) {
      {
        "Stephen Spielberg"=>1357566430,
        "Russo Brothers"=>2281002470,
        "James Cameron"=>2571020373,
        "Spike Lee"=>256624217,
        "Wachowski Siblings"=>806180282,
        "Robert Zemeckis"=>1273838385,
        "Quentin Tarantino"=>662738268,
        "Martin Scorsese"=>636812242,
        "Francis Ford Coppola"=>509719258
      }
    }

    it "correctly totals 'Stephen Spielberg'" do
      expect(directors_totals['Stephen Spielberg']).to eq(expected['Stephen Spielberg'])
    end

    it "correctly totals 'Russo Brothers'" do
      expect(directors_totals['Russo Brothers']).to eq(expected['Russo Brothers'])
    end

    it "correctly totals 'James Cameron'" do
      expect(directors_totals['James Cameron']).to eq(expected['James Cameron'])
    end

    it "correctly totals 'Spike Lee'" do
      expect(directors_totals['Spike Lee']).to eq(expected['Spike Lee'])
    end

    it "correctly totals 'Wachowski Siblings'" do
      expect(directors_totals['Wachowski Siblings']).to eq(expected['Wachowski Siblings'])
    end

    it "correctly totals 'Robert Zemeckis'" do
      expect(directors_totals['Robert Zemeckis']).to eq(expected['Robert Zemeckis'])
    end

    it "correctly totals 'Quentin Tarantino'" do
      expect(directors_totals['Quentin Tarantino']).to eq(expected['Quentin Tarantino'])
    end

    it "correctly totals 'Martin Scorsese'" do
      expect(directors_totals['Martin Scorsese']).to eq(expected['Martin Scorsese'])
    end

    it "correctly totals 'Francis Ford Coppola'" do
      expect(directors_totals['Francis Ford Coppola']).to eq(expected['Francis Ford Coppola'])
    end
  end
end
