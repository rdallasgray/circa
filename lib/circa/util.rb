# encoding: UTF-8

module Circa
  module Util
    def valid_parts_as_args(parts)
      valid = self.valid_parts
      parts.take_while {|p| valid[p] }.map {|p| valid[p].to_i }
    end
  end
end
