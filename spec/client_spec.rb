require 'spec_helper'

describe Porni::Client do
  let(:page) { 'pornhub' }
  subject {Porni::Client}

  describe 'allowed pages' do
    it 'should return allowed pages' do
      expect(Porni::Client::ALLOWED_PAGES).to match_array(['porn.com', 'redtube.com', 'pornhub.com'])
    end
  end

  describe '.agent' do
    context 'pornhub' do
      let(:page) { 'pornhub' }
      it 'return correct agent class' do
        expect(subject.get_agent(page: page).class).to eq(Porni::Hubs::Pornhub)
      end
    end

    context 'redtube' do
      let(:page) { 'redtube' }
      it 'return correct agent class' do
        expect(subject.get_agent(page: page).class).to eq(Porni::Hubs::Redtube)
      end
    end

    context 'xvideos' do
      let(:page) { 'xvideos' }
      it 'return correct agent class' do
        expect(subject.get_agent(page: page).class).to eq(Porni::Hubs::Xvideos)
      end
    end

    context 'porn' do
      let(:page) { 'porn' }
      it 'return correct agent class' do
        expect(subject.get_agent(page: page).class).to eq(Porni::Hubs::Porn)
      end
    end

    context 'spankbang' do
      let(:page) { 'spankbang' }
      it 'return correct agent class' do
        expect(subject.get_agent(page: page).class).to eq(Porni::Hubs::Spankbang)
      end
    end

    context 'unknown' do
      let(:page) { 'unknown' }
      it 'should raise error' do
        expect{subject.get_agent(page: page).class}.to raise_error(Porni::MissingApiError)
      end
    end
  end
end
