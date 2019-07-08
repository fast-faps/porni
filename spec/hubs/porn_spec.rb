require 'spec_helper'

describe Porni::Hubs::Porn do
  subject {Porni::Hubs::Porn.new}
  describe '#base_url' do
    it "set correct endpoint" do
      expect(subject.base_url).to eq("https://api.porn.com/videos")
    end
  end

  describe '#get_video' do
    let(:id) { '5430101' }

    context "found video" do
      before do
        stub_request(:get, "https://api.porn.com/videos/find.json?id=#{id}").to_return(body: fixture('get_video_porn_ok.json'))
      end

      it "return json response" do
        body = subject.get_video(id)
        expect(body.keys).to eq(["success", "message", "code", "count", "result"])
        expect(body["success"]).to be(true)
      end
    end

    context "not found video" do
      before do
        stub_request(:get, "https://api.porn.com/videos/find.json?id=#{id}").to_return(body: fixture('get_video_porn_error.json'))
      end

      it "return json response" do
        body = subject.get_video(id)
        expect(body["success"]).to be(false)
      end
    end
  end

  describe '#get_video_standardized' do
    let(:id) { '5430101' }

    context "found video" do
      before do
        stub_request(:get, "https://api.porn.com/videos/find.json?id=#{id}").to_return(body: fixture('get_video_porn_ok.json'))
      end

      it "return valid object" do
        video = subject.get_video_standardized(id)
        expect(video.class).to eq(Porni::Video)
        expect(video.valid).to eq(true)
      end
    end

    context "not found video" do
      before do
        stub_request(:get, "https://api.porn.com/videos/find.json?id=#{id}").to_return(body: fixture('get_video_porn_error.json'))
      end

      it "return invalid object" do
        video = subject.get_video_standardized(id)
        expect(video.class).to eq(Porni::Video)
        expect(video.valid).to eq(false)
      end
    end
  end
end
