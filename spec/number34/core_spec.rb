require_relative '../../lib/number34/core'

describe Number34::Core do
  let(:subject) { Number34::Core.make }

  describe '#capabilities_collection' do
    it 'call down' do
      subject.configuration.capabilities_map[:desktop] = [1,2,3]
      collection = subject.capabilities_collection(:desktop)
      expect(collection).to eq([1,2,3])
    end
  end

  describe '#test_against' do
    
  end
end