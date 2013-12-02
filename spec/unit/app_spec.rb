require 'spec_helper'

require 'app_gate/apps'

describe AppGate::Apps, '#valid?' do
  it 'should validate the passed application identifier' do
    AppGate::Apps.valid?('123').should be_false
    AppGate::Apps.stubs(:ids).returns({ taco: 'shrimp'})
    AppGate::Apps.valid?('shrimp').should be_true
  end
end
