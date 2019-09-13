require 'spec_helper'

describe 'derp' do
  it 'true' do
    expect true
  end
end

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
      expect(directors_totals['Stephen Spielberg']).to eq(1357566430)
    end

    it "correctly totals 'Russo Brothers'" do
      expect(directors_totals['Russo Brothers']).to eq(2281002470)
    end

    it "correctly totals 'James Cameron'" do
      expect(directors_totals['James Cameron']).to eq(2571020373)
    end

    it "correctly totals 'Spike Lee'" do
      expect(directors_totals['Spike Lee']).to eq(256624217)
    end

    it "correctly totals 'Wachowski Siblings'" do
      expect(directors_totals['Wachowski Siblings']).to eq(806180282)
    end

    it "correctly totals 'Robert Zemeckis'" do
      expect(directors_totals['Robert Zemeckis']).to eq(1273838385)
    end

    it "correctly totals 'Quentin Tarantino'" do
      expect(directors_totals['Quentin Tarantino']).to eq(662738268)
    end

    it "correctly totals 'Martin Scorsese'" do
      expect(directors_totals['Martin Scorsese']).to eq(636812242)
    end

    it "correctly totals 'Francis Ford Coppola'" do
      expect(directors_totals['Francis Ford Coppola']).to eq(509719258)
    end
  end
end
