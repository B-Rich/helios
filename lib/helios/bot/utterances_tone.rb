require "helios/bot/utterance"


module Helios
  module Bot
    class UtterancesTone
      attr_reader :utterances, :raw

      def initialize(utterances_tone)
        @raw = utterances_tone
        @utterances = []
        build_utterances(utterances_tone)
      end

      def build_utterances(utterances_tone)
        utterances_tone["utterances_tone"].each do |utterance|
          @utterances << Helios::Bot::Utterance.new(utterance)
        end
      end

    end
  end
end
