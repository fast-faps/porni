require 'spec_helper'

describe Porni::Hubs::Parser::RedtubeParser do
  context "success body" do
    before do
      @body = Oj.load_file(fixture('get_video_redtube_ok.json').path)
      @video = Porni::Hubs::Parser::PornhubParser.parse_video(@body)
    end

    it "return correct attributes" do
      expect(@video.valid).to be(true)
      expect(@video.duration).to eq("7:46")
      expect(@video.title).to eq("NubileFilms - Hot Shower Sex With Leah Gotti")
      expect(@video.thumb).to eq("https://ei.rdtcdn.com/m=e0YH8f/media/videos/201701/05/1917991/original/15.jpg")
      expect(@video.views).to eq(623250)
      expect(@video.channel).to be(nil)
      expect(@video.tags.size).to eq(16)
      expect(@video.pornstars).to match_array([])
    end
  end

  context "error body" do
    before do
      @body = Oj.load_file(fixture('get_video_redtube_error.json').path)
      @video = Porni::Hubs::Parser::PornhubParser.parse_video(@body)
    end

    it "return correct attributes" do
      expect(@video.valid).to be(false)
      expect(@video.raw).to eq(@body)
    end
  end
end
 
