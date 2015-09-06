require 'spec_helper'

describe Dota2::Static::Ability do
  describe '::all' do
    it 'returns all abilities' do
      abilities = Dota2::Static::Ability.all
      expect(abilities).to be_a Array
      expect(abilities.first).to be_a Dota2::Static::Ability
    end
  end

  describe '::find' do
    it 'given an id returns ability with specified id' do
      hero = Dota2::Static::Ability.find(5006)
      expect(hero.internal_name).to eq 'antimage_mana_void'
      expect(hero.name).to eq 'Mana Void'
      expect(hero.type).to eq 'DOTA_ABILITY_TYPE_ULTIMATE'
      expect(hero.image).to eq 'dota2/static/abilities/antimage_mana_void_lg.png'
      expect(hero).to be_a Dota2::Static::Ability
    end

    it "given an id returns nil if hero doesn't exist" do
      expect(Dota2::Static::Ability.find(1)).to be_nil
    end
  end
end
