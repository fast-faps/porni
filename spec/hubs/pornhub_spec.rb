require 'spec_helper'
require 'byebug'

describe Porni::Hubs::Pornhub do
  subject {Porni::Hubs::Pornhub.new}
  describe '#base_url' do
    it "set correct endpoint" do
      expect(subject.base_url).to eq("https://www.pornhub.com/webmasters")
    end
  end

  describe '#get_video' do
    let(:id) { 'ph57889525050e1' }

    context "found video" do
      before do
        stub_request(:get, "https://www.pornhub.com/webmasters/video_by_id?id=#{id}").to_return(body: fixture('get_video_pornhub_ok.json'))
      end

      it "return json response" do
        body = subject.get_video(id)
        expect(body.keys).to eq(['video'])
      end
    end

    context "not found video" do
      before do
        stub_request(:get, "https://www.pornhub.com/webmasters/video_by_id?id=#{id}").to_return(body: fixture('get_video_pornhub_error.json'))
      end

      it "return json response" do
        body = subject.get_video(id)
        expect(body["code"]).to eq('2002')
      end
    end
  end

  describe '#get_video_standardized' do
    let(:id) { 'ph57889525050e1' }

    context "found video" do
      before do
        stub_request(:get, "https://www.pornhub.com/webmasters/video_by_id?id=#{id}").to_return(body: fixture('get_video_pornhub_ok.json'))
      end

      it "return valid object" do
        video = subject.get_video_standardized(id)
        expect(video.class).to eq(Porni::Video)
        expect(video.valid).to eq(true)
      end
    end

    context "not found video" do
      before do
        stub_request(:get, "https://www.pornhub.com/webmasters/video_by_id?id=#{id}").to_return(body: fixture('get_video_pornhub_error.json'))
      end

      it "return invalid object" do
        video = subject.get_video_standardized(id)
        expect(video.class).to eq(Porni::Video)
        expect(video.valid).to eq(false)
      end
    end

  end
end
