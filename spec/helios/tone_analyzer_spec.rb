require 'spec_helper'

describe Helios::Bot::ToneAnalyzer do

  describe '.tone' do
    before :each do
        stub_tone_analyzer_response = ExampleToneResponse.new
        allow(Helios::Bot::ToneAnalyzer).to receive(:post).and_return(stub_tone_analyzer_response)
    end
    it 'Should return Helios::Bot::DocumentTones instance' do
      expect(Helios::Bot::ToneAnalyzer.tone("")).to be_kind_of(Helios::Bot::DocumentTones)
    end
  end

  describe '.engagement_tone' do
    before :each do
        stub_tone_analyzer_response = ExampleEngagementToneResponse.new
        allow(Helios::Bot::ToneAnalyzer).to receive(:post).and_return(stub_tone_analyzer_response)
    end
    it 'Should return Helios::Bot::UtterancesTone instance' do
      expect(Helios::Bot::ToneAnalyzer.engagement_tone("")).to be_kind_of(Helios::Bot::UtterancesTone)
    end
  end
end

class ExampleToneResponse
  def body
    '{
      "document_tone": {
        "tone_categories": [{
            "tones": [{
                "score": 0.25482,
                "tone_id": "anger",
                "tone_name": "Anger"
              }
            ],
            "category_id": "emotion_tone",
            "category_name": "Emotion Tone"
          },
          {
            "tones": [{
                "score": 0.999,
                "tone_id": "analytical",
                "tone_name": "Analytical"
              }
            ],
            "category_id": "language_tone",
            "category_name": "Language Tone"
          },
          {
            "tones": [{
                "score": 0.271,
                "tone_id": "openness_big5",
                "tone_name": "Openness"
              }
            ],
            "category_id": "social_tone",
            "category_name": "Social Tone"
          }
        ]
      }
    }'
  end
end

class ExampleEngagementToneResponse
  def body
    '{
      "utterances_tone": [
      {
        "utterance_id": "string",
        "utterance_text": "string",
        "tones": [
          {
            "tone_name": "string",
            "tone_id": "string",
            "score": 0
          }
        ]
      }
      ]
    }'
  end
end
