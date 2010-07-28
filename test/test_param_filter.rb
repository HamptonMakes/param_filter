require 'helper'

class TestParamFilter < Test::Unit::TestCase
  
  def params
    {"documents"=>{"regular_rank"=>"5", "age>-"=>"4", "title~"=>"he", "is_valid"=>"true"}}
  end

  def model_filter
    Document
  end

  should "parse without issue" do
    model = ParamFilter.process(model_filter, params["documents"])
    puts model.to_sql
  end
end
