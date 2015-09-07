require_relative '../../lib/number34/capabilities_helper'

describe Number34::CapabilitiesHelper do
  describe '::get_collection' do
    it 'return desired collection' do
      collection = described_class::get_collection({
        desktop: [1, 2, 3],
        mobile: [1, 2]
      }, :desktop)

      expect(collection).to eq([1, 2, 3])
    end

    it 'return all collection' do
      collection = described_class::get_collection({
        desktop: [1, 2, 3],
        mobile: [1, 2]
      })

      expect(collection).to eq([1, 2, 3, 1, 2])
    end
  end
end