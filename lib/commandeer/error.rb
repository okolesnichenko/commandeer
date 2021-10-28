module Commandeer
  class Error

    attr_accessor :code, :data, :message

    def initialize(data, message, code = self.class.to_s)
      @data = data
      @message = message
      @code = code
    end

  end
end
