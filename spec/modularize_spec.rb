require 'spec_helper'

describe Modularize do
  after do
    Object.send(:remove_const, :Fruit) if defined?(Fruit)
    Object.send(:remove_const, :Animals) if defined?(Animals)
  end

  it 'creates a single module' do
    defined?(Fruit).should == nil
    Modularize.create('Fruit')
    defined?(Fruit).should_not == nil
  end

  it 'creates nested modules' do
    defined?(Animals::Cats::Bombay).should == nil
    Modularize.create('Animals::Cats::Bombay')
    defined?(Animals::Cats::Bombay).should_not == nil
  end

  it 'creates from given root' do
    Modularize.create('Fruit')
    Modularize.create('Orange', Fruit)
    defined?(Fruit::Orange).should_not == nil
  end

  it 'can create the same one twice' do
    Modularize.create('Fruit')
    Modularize.create('Fruit')
    defined?(Fruit).should_not == nil
  end

  it 'doenst overwrite old modules' do
    Modularize.create('Fruit::Orange')
    Modularize.create('Fruit')
    defined?(Fruit::Orange).should_not == nil
  end

  context 'when a decendant module name already exists on the root' do
    it 'creates a decendant module in the correct namespace' do
      defined?(Computers::Keyboards).should == nil
      Modularize.create('Keyboards')
      Modularize.create('Computers::Keyboards')
      defined?(Computers::Keyboards).should_not == nil
    end

    after do
      Object.send(:remove_const, :Computers) if defined?(Computers)
      Object.send(:remove_const, :Keyboards) if defined?(Keyboards)
    end
  end
end
