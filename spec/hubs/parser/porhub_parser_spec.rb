require 'spec_helper'

describe Porni::Hubs::Parser::PornhubParser do
  context "success body" do
    before do
      @body = Oj.load_file(fixture('get_video_pornhub_ok.json').path)
      @video = Porni::Hubs::Parser::PornhubParser.parse_video(@body)
    end

    it "return correct attributes" do
      expect(@video.valid).to be(true)
      expect(@video.title).to eq("BLACKED First Interracial For Petite Teen Kristen Scott")
      expect(@video.duration).to eq("11:57")
      expect(@video.thumb).to eq("https://di.phncdn.com/videos/201607/15/82305431/original/(m=eaf8Ggaaaa)(mh=K0RBbsJQf2wF3tGo)12.jpg")
      expect(@video.views).to eq(3766775)
      expect(@video.channel).to be(nil)
      expect(@video.tags.size).to eq(20)
      expect(@video.pornstars).to match_array(["Joss Lescaf", "Kristen Scott"])
    end
  end

  context "error body" do
    before do
      @body = Oj.load_file(fixture('get_video_pornhub_error.json').path)
      @video = Porni::Hubs::Parser::PornhubParser.parse_video(@body)
    end

    it "return correct attributes" do
      expect(@video.valid).to be(false)
      expect(@video.raw).to eq(@body)
    end
  end
end
 
