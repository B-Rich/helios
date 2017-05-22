require 'spec_helper'

describe Helios::Bot::ToneAnalyzer do
  before :each do
      stub_toneAnalyzer_response = ExampleToneResponse.new
      allow(Helios::Bot::ToneAnalyzer).to receive(:post).and_return(stub_toneAnalyzer_response)
  end
  it '.tone' do
    expect(Helios::Bot::ToneAnalyzer.tone("")).to be_kind_of(Helios::Bot::DocumentTones)
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
