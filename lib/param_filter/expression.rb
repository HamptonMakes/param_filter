module ParamFilter
  class Expression
    OPERANDS = {
      ">" => "> ?",
      "<" => "< ?",
      ">-" => ">= ?",
      "<-" => "<= ?",
      "~" => "LIKE ?",
      "!~" => "IS NOT LIKE ?",
      "!=" => "!= ?",
      "!!" => "IS NOT NULL",
      "_nil" => "IS NULL",
      "-" => "= ?",
      "" => "= ?"
    }
    
    PARAM_OPERANDS = (OPERANDS.sort_by { |o| 0 - o.first.size }).collect &:first

    def initialize(column_name, value)
      @param_operand = PARAM_OPERANDS.detect { |o| column_name.ends_with?(o) }
      @operand = OPERANDS[@param_operand]
      @name = column_name[0..(-1 - @param_operand.size)]
      @value = value
      
      if @operand == "LIKE ?"
        @value = "#{@value}%"
      end
    end
    
    def filter!(model)
      model.where("#{@name} #{@operand}", @value)
    end
  end
end