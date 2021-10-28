module Commandeer
  class Base
    attr_accessor :success, :data, :error, :options

    def initialize(params)
      @success = true
      @options = params
    end

    def call
      raise NotImplementedError
    end

    def step(success_method, if_fail = nil)
      return self unless self.success
      res = success_method.is_a?(Proc) ? success_method.call(self) : self.send(success_method)
      unless res
        self.success = false
        unless if_fail.nil?
          if_fail.is_a?(Proc) ? if_fail.call(self) : self.send(if_fail)
        end
      end
      self
    end

    def pass(success_method)
      success_method.is_a?(Proc) ? success_method.call(self) : self.send(success_method)
      self
    end

    def err(data, message)
      self.error = Error.new(data, message)
    end
  end
end
