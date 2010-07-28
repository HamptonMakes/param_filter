require 'rubygems'
require 'test/unit'
require 'shoulda'
require 'active_record'

ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => File.join(File.dirname(__FILE__), '..', 'tmp', 'db.sqlite'))

require File.expand_path('../models/document', __FILE__)
require File.expand_path('../bootstrap', __FILE__)

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'param_filter'

class Test::Unit::TestCase
end
