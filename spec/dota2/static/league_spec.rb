require 'spec_helper'

describe Dota2::Static::League do
  describe '::all' do
    it 'returns all leagues' do
      leagues = Dota2::Static::League.all
      expect(leagues).to be_a Array
      expect(leagues.first).to be_a Dota2::Static::League
    end
  end

  describe '::find' do
    it 'given an id returns league with specified id' do
      hero = Dota2::Static::League.find(2418)
      expect(hero.name).to eq 'SLTV Star Series Season 12 Ticket'
      expect(hero.tournament_url).to eq 'http://dota2.starladder.tv/'
      expect(hero.image_banner).to eq 'dota2/static/leagues/subscriptions_sltv_star_series_season_12_ingame.png'
      expect(hero.image).to eq 'dota2/static/leagues/subscriptions_sltv_star_series_season_12.png'
      expect(hero).to be_a Dota2::Static::League
    end

    it "given an id returns nil if league doesn't exist" do
      expect(Dota2::Static::League.find(1)).to be_nil
    end
  end
end
