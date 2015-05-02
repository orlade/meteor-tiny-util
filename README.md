# TinyUtil

**TinyUtil** is a tiny set of tiny utility functions for testing Meteor packages with Meteor's
Tinytest. It is intended for use with [`peterellisjones:describe`][describe].

## `swap`

Emulates the use of `beforeEach` and `afterEach` methods of a test class to set up and tear down a
property of an object. Useful for mocking values that only persist for the duration of the test.

```
describe "MyClassUnderTest", ->
  # Wrapper that creates a temporary instance of `MyClassUnderTest` and attaches it to each wrapped
  # test function under the `obj` property.
  wrapped = swap @, 'obj', -> new MyClassUnderTest
  
  it "can do the foo", wrapped (test) ->
    test.isTrue @obj.foo()
```

[describe]: https://github.com/peterellisjones/describe
