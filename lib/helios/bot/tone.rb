module Helios
  module Bot
    class Tone
      attr_reader :id, :score, :name

      def initialize(attrs = {})
        @id = attrs["tone_id"]
        @score = attrs["score"]
        @name = attrs["tone_name"]
      end
    end
  end
end
