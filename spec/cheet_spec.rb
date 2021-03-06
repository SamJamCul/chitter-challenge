require 'cheet'

describe Cheet do

  describe '.create' do
    it 'creates a new cheet' do
      newcheet = Cheet.create(content: "new")
      expect(newcheet.content).to eq("new")
    end
  end

  describe '.all' do
    it 'returns a list of cheets' do
      cheet = Cheet.create(content: "first")
      Cheet.create(content: "second")
      Cheet.create(content: "third")

      cheets = Cheet.all

      expect(cheets.length).to eq 3
      expect(cheets.last).to be_a Cheet
      expect(cheets.last.id).to eq cheet.id
      expect(cheets.last.content).to eq 'first'
    end
  end
end
