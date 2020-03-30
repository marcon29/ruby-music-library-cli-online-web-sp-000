module Concerns::Findable
  def find_by_name(name)
    all.detect{ |inst| inst.name == name }
  end

#  def self.find_or_create_by_name(name)
#    if self.find_by_name(name)
#      self.find_by_name(name)
#    else
#      self.create(name)
#    end
#  end

end
