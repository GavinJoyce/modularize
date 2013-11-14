require 'spec_helper'

describe Modulize do
  it 'creates a single module' do
    defined?(Fruit).should == nil
    Modulize.create('Fruit')
    defined?(Fruit).should_not == nil
  end
end
