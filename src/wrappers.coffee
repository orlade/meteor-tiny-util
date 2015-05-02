# Test function wrappers providing emulating high-level test framework capabilities.

# Returns a function that can be used to wrap other functions. Wrapped functions will have the
# `args.before` function run before them and the `args.after` function run after. Useful for
# emulating the `beforeEach` and `afterEach` functionality of more substantial test frameworks.
wrap = (args) ->
  (func) ->
    (test) ->
      args.before?()
      func(test)
      args.after?()

# Replaces the value of the `key` field of `obj` with the given `value` for the duration of any test
# wrapped in the returned function. If the provided `value` is a function, it will be evaluated to
# get the value to assign. If you want to assign a function as a value, use `swapFn`.
swap = (obj, key, value) ->
  original = obj[key]
  wrap
    before: -> obj[key] = if typeof value == 'function' then value() else value
    after: -> obj[key] = original

# Same as `swap`, except assigns a function as a value instead of evaluating it (kind of).
swapFn = (obj, key, func) -> swap obj, key, -> func()
