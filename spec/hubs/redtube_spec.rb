require 'spec_helper'

describe Porni::Hubs::Redtube do
  subject {Porni::Hubs::Redtube.new}
  describe '#base_url' do
    it "set correct endpoint" do
      expect(subject.base_url).to eq("https://api.redtube.com")
    end
  end

  describe '#get_video' do
    let(:id) { '1917991' }

    context "found video" do
      before do
        stub_request(:get, "https://api.redtube.com/?data=redtube.Videos.getVideoById&video_id=#{id}&output=json&thumbsize=all").to_return(body: fixture('get_video_redtube_ok.json'))
      end

      it "return json response" do
        body = subject.get_video(id)
        expect(body.keys).to eq(['video'])
      end
    end

    context "not found video" do
      before do
        stub_request(:get, "https://api.redtube.com/?data=redtube.Videos.getVideoById&video_id=#{id}&output=json&thumbsize=all").to_return(body: fixture('get_video_redtube_error.json'))
      end

      it "return json response" do
        body = subject.get_video(id)
        expect(body["code"]).to eq(2002)
      end
    end
  end

  describe '#get_video_standardized' do
    let(:id) { '1917991' }

    context "found video" do
      before do
        stub_request(:get, "https://api.redtube.com/?data=redtube.Videos.getVideoById&video_id=#{id}&output=json&thumbsize=all").to_return(body: fixture('get_video_redtube_ok.json'))
      end

      it "return valid object" do
        video = subject.get_video_standardized(id)
        expect(video.class).to eq(Porni::Video)
        expect(video.valid).to eq(true)
      end
    end

    context "not found video" do
      before do
        stub_request(:get, "https://api.redtube.com/?data=redtube.Videos.getVideoById&video_id=#{id}&output=json&thumbsize=all").to_return(body: fixture('get_video_redtube_error.json'))
      end

      it "return invalid object" do
        video = subject.get_video_standardized(id)
        expect(video.class).to eq(Porni::Video)
        expect(video.valid).to eq(false)
      end
    end

  end
end
