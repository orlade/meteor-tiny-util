Package.describe({
  name: 'orlade:tiny-util',
  summary: 'Tiny utility functions for Meteor\'s TinyTest',
  version: '0.1.0',
  git: 'https://github.com/orlade/meteor-tiny-util.git'
});

Package.onUse(function(api) {
  api.versionsFrom('METEOR@0.9.0');
  api.use(['coffeescript']);
  api.export([
    'wrap',
    'swap',
    'swapFn'
  ]);
  api.addFiles(['src/wrappers.coffee']);
});
