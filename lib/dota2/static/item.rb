require 'yaml'

module Dota2
  module Static
    class Item
      MAP = YAML.load_file(File.expand_path('../../../../data/items.yml', __FILE__)).freeze

      attr_reader :id, :name, :internal_name, :image

      def self.find(id)
        MAP[id] ? new(id) : nil
      end

      def self.all
        MAP.keys.map { |id| new(id) }
      end

      private

      def initialize(id)
        item = MAP[id]
        @id = id
        @name = item['name']
        @internal_name = item['internal_name']
        @image = "dota2/static/items/#{item['internal_name']}_lg.png"
      end
    end
  end
end
