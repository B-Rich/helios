require "helios/bot/document_tones"
require "helios/bot/tone"

module Helios
  module Bot
    class ToneAnalyzer < Olimpo::Base
      def self.tone(text, options = {})
        response = self.post("/tone", body: { text: text }.to_json,
                                      headers: { "Content-Type" => "application/json" },
                                      query: default_tone_options.merge(options))

        parsed_response = JSON.parse(response.body)

        Helios::Bot::DocumentTones.new(parsed_response)


        #return parsed_response["languages"].map do |attrs|
          #Hermes::Bot::Language.new(attrs)
        #end if response.success?

        #raise_exception(response.code, response.body)
      end

      private

      def self.default_tone_options
        {
          version: "2016-05-19"
        }
      end
    end
  end
end
