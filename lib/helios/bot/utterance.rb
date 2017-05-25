module Helios
  module Bot
    class Utterance
      attr_reader :id, :text, :tones

      def initialize(attrs = {})
        @id = attrs["utterance_id"]
        @text = attrs["utterance_text"]
        @tones = attrs["tones"]
      end
    end
  end
end
