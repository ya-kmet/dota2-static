require 'yaml'

module Dota2
  module Static
    class Hero
      MAP = YAML.load_file(File.expand_path('../../../../data/heroes.yml', __FILE__)).freeze

      attr_reader :id, :name, :internal_name, :image, :abilities, :ultimate

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
        @image = "dota2/static/heroes/#{hero['internal_name']}.png"
        @abilities = hero['abilities'].map do |ability|
          Dota2::Static::Ability.find(ability)
        end.compact
        @ultimate = @abilities.find(&:ultimate?)
      end
    end
  end
end
