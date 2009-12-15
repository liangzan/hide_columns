require 'spec'
require 'spec/autorun'
require 'rubygems'
require 'mocha'
require 'active_support'
require 'active_record'
$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'hide_columns'

Spec::Runner.configure do |config|

end

class MockedModel
  include HideColumns
end
