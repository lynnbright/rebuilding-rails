class Object
  def self.const_missing(c)
    require "./boo"
    Boo
  end
end

Boo.new.print_boo
