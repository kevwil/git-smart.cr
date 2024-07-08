class Object
  def tapp(prefix = nil, &block)
    block ||= lambda {|x| x }
    str = if block[self].is_a? String
        block[self]
      else
        block[self].inspect
      end
    !p [prefix, str].compact.join(": ")
    self
  end
end
