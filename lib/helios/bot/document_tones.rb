module Helios
  module Bot
    class DocumentTones
      attr_reader :tones, :raw

      def initialize(document_tone)
        @raw = document_tone["document_tone"]["tone_categories"]
        @tones = []
        build_tones(document_tone)
      end

      def build_tones(document_tone)
        document_tone["document_tone"]["tone_categories"].each do |category|
          category["tones"].each do |tone|
            @tones << Helios::Bot::Tone.new(tone)
          end
        end
      end
    end
  end
end
