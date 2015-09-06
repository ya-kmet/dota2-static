require 'yaml'

module Dota2
  module Static
    class Ability
      TYPE_ULTIMATE = 'DOTA_ABILITY_TYPE_ULTIMATE'

      MAP = YAML.load_file(File.expand_path('../../../../data/abilities.yml', __FILE__)).freeze

      attr_reader :id, :internal_name, :name, :type, :image

      def self.find(id)
        MAP[id] ? new(id) : nil
      end

      def self.all
        MAP.keys.collect { |id| new(id) }
      end

      def ultimate?
        type == TYPE_ULTIMATE
      end

      private

      def initialize(id)
        ability = MAP[id]
        @id = id
        @name = ability['name']
        @internal_name = ability['internal_name']
        @type = ability['type']
        @image = "dota2/static/abilities/#{ability['internal_name']}_lg.png"
      end
    end
  end
end
