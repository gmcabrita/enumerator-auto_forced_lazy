# frozen_string_literal: true

module Enumerable
  # Returns an Enumerator::AutoForcedLazy, which wraps Enumerator::Lazy to
  # provide access to Array methods without requiring a previous explicit call
  # to Enumerator::Lazy#force.
  def auto_forced_lazy
    lazy.auto_force
  end
end
