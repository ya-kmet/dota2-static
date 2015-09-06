require 'yaml'

module Dota2
  module Static
    class League
      MAP = YAML.load_file(File.expand_path('../../../../data/leagues.yml', __FILE__)).freeze
      attr_reader :id, :name, :description, :tournament_url, :image, :image_banner

      def self.find(id)
        MAP[id] ? new(id) : nil
      end

      def self.all
        MAP.keys.collect { |id| new(id) }
      end

      private

      def initialize(id)
        league = MAP[id]
        @id = id
        @name = league['name']
        @description = league['description']
        @tournament_url = league['tournament_url']
        @image = ['dota2', 'static', 'leagues', league['image']].join('/')
        @image_banner = ['dota2', 'static', 'leagues', league['image_banner']].join('/')
      end
    end
  end
end
