module ParamFilter
  class Expression
    def initialize(column_name, value)
      @name = column_name
      @value = value
    end
    
    def filter!(model)
      model.where("#{@name} = #{@value}")
    end
  end
end