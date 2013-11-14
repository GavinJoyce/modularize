class Modulize
  def self.create(name)
    new_module = Object.const_defined?(name) ? Object.const_get(name) : nil

    unless nil
      new_module = Module.new
      Object.const_set name, new_module
    end
  end
end
