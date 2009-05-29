require 'pathname'
require 'rubygems' unless RUBY_VERSION >= '1.9.1'
require 'minitest/unit'

root  = Pathname(__FILE__).dirname.parent.parent.expand_path
require root + 'lib/phocus'

class MiniTest::Unit::TestCase
  include ::Phocus
end

Phocus.method_pattern = /^test_/

MiniTest::Unit.autorun
