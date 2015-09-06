require 'spec_helper'

describe Dota2::Static::Hero do
  describe '::all' do
    it 'returns all heroes' do
      heroes = Dota2::Static::Hero.all
      expect(heroes).to be_a Array
      expect(heroes.first).to be_a Dota2::Static::Hero
    end
  end

  describe '::find' do
    before :each do
      @hero = Dota2::Static::Hero.find(1)
    end

    it 'given an id returns hero with specified id' do
      expect(@hero).to be_a Dota2::Static::Hero
      expect(@hero.id).to eq 1
    end

    it 'assigns internal_name with proper value' do
      expect(@hero.internal_name).to eq 'antimage'
    end

    it 'assigns name with proper value' do
      expect(@hero.name).to eq 'Anti-Mage'
    end

    it 'assigns images fields with proper values' do
      expect(@hero.image_sb).to eq 'dota2/static/heroes/antimage_sb.png'
      expect(@hero.image_lg).to eq 'dota2/static/heroes/antimage_lg.png'
      expect(@hero.image_full).to eq 'dota2/static/heroes/antimage_full.png'
      expect(@hero.image_vert).to eq 'dota2/static/heroes/antimage_vert.jpg'
    end

    it 'assigns abilities with proper values' do
      expect(@hero.abilities.size).to eq(4)
      expect(@hero.abilities.first).to be_a Dota2::Static::Ability
    end

    it "given an id returns nil if hero doesn't exist" do
      expect(Dota2::Static::Hero.find(0)).to be_nil
    end
  end
end
