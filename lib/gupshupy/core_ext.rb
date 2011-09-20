class NilClass
  def blank?
    true
  end unless nil.respond_to? :blank?
end

class String
  def blank?
    self !~ /\S/
  end unless "".respond_to? :blank?
end


