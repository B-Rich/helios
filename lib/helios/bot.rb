require "helios/bot/version"
require "olimpo"

module Helios
  module Bot
    extend Olimpo
    autoload :ToneAnalyzer, "helios/bot/tone_analyzer"
  end
end
