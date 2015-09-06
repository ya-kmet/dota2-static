require 'yaml'

module Dota2
  module Static
    class Hero
      MAP = YAML.load_file(File.expand_path('../../../../data/heroes.yml', __FILE__)).freeze

      attr_reader :id, :name, :internal_name, :image_sb, :image_lg, :image_full, :image_vert, :abilities, :ultimate

      def self.find(id)
        MAP[id] ? new(id) : nil
      end

      def self.all
        MAP.keys.collect { |id| new(id) }
      end

      private

      def initialize(id)
        hero = MAP[id]
        @id = id
        @internal_name = hero['internal_name']
        @name = hero['name']
        @image_sb = "dota2/static/heroes/#{hero['internal_name']}_sb.png"
        @image_lg = "dota2/static/heroes/#{hero['internal_name']}_lg.png"
        @image_full = "dota2/static/heroes/#{hero['internal_name']}_full.png"
        @image_vert = "dota2/static/heroes/#{hero['internal_name']}_vert.jpg"
        @abilities = hero['abilities'].map do |ability|
          Dota2::Static::Ability.find(ability)
        end.compact
        @ultimate = @abilities.find(&:ultimate?)
      end
    end
  end
end
