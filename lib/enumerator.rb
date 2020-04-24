# frozen_string_literal: true

require "delegate"

class Enumerator
  # Enumerator::AutoForcedLazy is a thin wrapper around Enumerator::Lazy that
  # automatically calls Enumerator::Lazy#force before a method call if the
  # called method does not exist on Enumerator::Lazy but exists on Array.
  #
  # Enumerator::AutoForcedLazy can be constructed from any Enumerator::Lazy
  # with the Enumerator::Lazy#auto_force method.
  #
  #    (1..Float::INFINITY).lazy.auto_force.take_while { |i| i < 30 }
  #    => #<Enumerator::Lazy: #<Enumerator::Lazy: 1..Infinity>:take_while>
  #
  # Alternatively, Enumerator::AutoForcedLazy can also be constructed from any
  # and from any Enumerable with the Enumerable#auto_forced_lazy method.
  #
  #    (1..Float::INFINITY).auto_forced_lazy.take_while { |i| i < 30 }
  #    => #<Enumerator::Lazy: #<Enumerator::Lazy: 1..Infinity>:take_while>
  #
  # It is useful for keeping lazy enumerator semantics while providing easier
  # access to Array methods by not requiring users to explicitly call
  # Enumerator::Lazy#force.
  class AutoForcedLazy < SimpleDelegator
    ARRAY_OBJ = [].freeze

    def initialize(lazy_enum)
      super(lazy_enum)
    end

    # rubocop:disable Style/MissingRespondToMissing
    def method_missing(m, *args, &block)
      if __getobj__.respond_to?(m)
        result = __getobj__.send(m, *args, &block)

        if result.is_a?(Enumerator::Lazy)
          __setobj__(result)

          self
        else
          result
        end
      elsif ARRAY_OBJ.respond_to?(m)
        __getobj__.force.send(m, *args, &block)
      else
        super
      end
    end
    # rubocop:enable Style/MissingRespondToMissing
  end

  class Lazy
    # Returns an Enumerator::AutoForcedLazy, which wraps Enumerator::Lazy to
    # provide access to Array methods without requiring a previous explicit
    # call to Enumerator::Lazy#force.
    def auto_force
      AutoForcedLazy.new(self)
    end
  end
end
