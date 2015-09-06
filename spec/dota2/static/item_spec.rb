require 'spec_helper'

describe Dota2::Static::Item do
  describe '::all' do
    it 'returns an array of items' do
      items = Dota2::Static::Item.all
      expect(items).to be_a Array
      expect(items.first).to be_a Dota2::Static::Item
    end
  end

  describe '::find' do
    it 'given an id returns item with specified id' do
      item = Dota2::Static::Item.find(108)
      expect(item).not_to be_nil
      expect(item).to be_a Dota2::Static::Item
      expect(item.internal_name).to eq 'ultimate_scepter'
      # expect(item.name).to eq "Aghanim's Scepter"
      expect(item.image).to eq 'dota2/static/items/ultimate_scepter_lg.png'
    end

    it "given an id returns nil if item doesn't exist" do
      expect(Dota2::Static::Item.find(0)).to be_nil
    end
  end
end