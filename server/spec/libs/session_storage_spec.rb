
require 'rails_helper'

RSpec.describe SessionStorage do
  describe 'set/get' do
    it 'returns nil when not found' do
      r = SessionStorage.get('some-key')
      expect(r.success?).to eq true
      expect(r.data).to eq nil
    end

    it 'returns data when found' do
      SessionStorage.set('some-key', 'some-value')
      r = SessionStorage.get('some-key')
      expect(r.success?).to eq true
      session = r.data
      expect(session).to eq 'some-value'
    end
  end

  describe 'remove' do
    it 'can delete the data' do
      SessionStorage.set('some-key', 'some-value')
      before_session = SessionStorage.get('some-key')
      remove_action = SessionStorage.remove('some-key')
      after_session = SessionStorage.get('some-key')
      expect(remove_action.success?).to eq true
      expect(before_session.data).not_to eq after_session.data
      expect(after_session.data).to eq nil
    end
  end
end
