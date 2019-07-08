require 'spec_helper'
require 'byebug'

describe Porni::Hubs::Parser::PornParser do
  context "success body" do
    before do
      @body = Oj.load_file(fixture('get_video_porn_ok.json').path)
      @video = Porni::Hubs::Parser::PornParser.parse_video(@body)
    end

    it "return correct attributes" do
      expect(@video.valid).to be(true)
      expect(@video.duration).to eq("13:30")
      expect(@video.title).to eq("Ashley Lane loves your warm cum on her face (POV Style)")
      expect(@video.thumb).to eq("https://i-e-cdn.porn.com/sc/5/5430/5430101/promo/crop/368/promo_1.jpg")
      expect(@video.views).to eq(893)
      expect(@video.channel).to eq('ATKGirlfriends')
      expect(@video.tags.size).to eq(17)
      expect(@video.pornstars).to match_array(["Ashley Lane"])
    end
  end

  context "error body" do
    before do
      @body = Oj.load_file(fixture('get_video_porn_error.json').path)
      @video = Porni::Hubs::Parser::PornParser.parse_video(@body)
    end

    it "return correct attributes" do
      expect(@video.valid).to be(false)
      expect(@video.raw).to eq(@body)
    end
  end
end
