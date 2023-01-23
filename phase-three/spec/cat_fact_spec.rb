require 'cat_fact'

describe CatFacts do
  it 'calls an API and returns a cat fact' do
    requester_cat = double :requester
    expect(requester_cat).to receive(:get).with(URI("https://catfact.ninja/fact")).and_return('{"fact":"The longest living cat on record according to the Guinness Book belongs to the late Creme Puff of Austin, Texas who lived to the ripe old age of 38 years and 3 days!","length":165}')

    cat_facts = CatFacts.new(requester_cat)
    result = cat_facts.provide
    expect(result).to eq 'Cat fact: The longest living cat on record according to the Guinness Book belongs to the late Creme Puff of Austin, Texas who lived to the ripe old age of 38 years and 3 days!'
  end
end
