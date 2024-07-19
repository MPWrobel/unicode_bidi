# frozen_string_literal: true

RSpec.describe UnicodeBidi do
  it 'has a version number' do
    expect(UnicodeBidi::VERSION).not_to be nil
  end

  it 'reverses RTL substrings within the string' do
    expect(UnicodeBidi.bidi('02/08/1894 היה יום לפני 03/08/1894')).to eq '03/08/1894 ינפל םוי היה 02/08/1894'
  end
end
