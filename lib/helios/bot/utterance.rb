require "helios/bot/tone"

module Helios
  module Bot
    class Utterance
      attr_reader :id, :text, :tones

      def initialize(attrs = {})
        @id = attrs["utterance_id"]
        @text = attrs["utterance_text"]
        @tones = []
        build_tones(attrs["tones"])
      end

      def build_tones(tones)
        tones.each do |tone|
          @tones << Helios::Bot::Tone.new(tone)
        end
      end

    end
  end
end
