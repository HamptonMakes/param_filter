require 'param_filter/expression'

module ParamFilter
  def self.process(model, params)
    set = Set.new(params, :only => model.columns)
    set.filter!(model)
  end
  
  class Set
    def initialize(params, options = {})
      @columns = options[:only] || nil
      @expressions = []
      parse(params)
    end
    
    def filter!(model)
      @expressions.each do |expression|
        model = expression.filter!(model)
      end
      model
    end

   private
   
    def parse(params)
      @expressions = params.collect do |key, value|
        Expression.new(key, value)
      end
    end
  end
end