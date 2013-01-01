# -*- encoding: utf-8 -*-

module TTY
  class Coercer

    class Range

      def self.coerce(value)
        case value.to_s
        when /\A(\-?\d+)\Z/
          ::Range.new($1.to_i, $1.to_i)
        when /\A(-?\d+?)(\.{2}\.?|-|,)(-?\d+)\Z/
          ::Range.new($1.to_i, $3.to_i, $2 == '...')
        else
          raise InvalidArgument, "#{value} could not be coerced into Range type"
        end
      end

    end # Range

  end # Coercer
end # TTY