# COMMANDEER GEM

Installation
------------
Add this to your Gemfile and run the bundle command.


```ruby
gem 'commandeer', :git => 'git@github.com:okolesnichenko/commandeer.git', require: true
```

Usage
------------
Define a command inherited from __Commandeer::Base__.

```ruby
class CommandOne < Commandeer::Base

  def call
    step -> (arg) do
      arg.options[:message] = 'Hello World!'
      arg.data = { message: arg.options[:message] }
    end
    step :say_hello, ->(arg) { err('Something wrong', 'Ruby error') }
  end

  private

  def say_hello
    pp options[:message]
  end
  
end
```

Run command.

```
irb(main):001:0> CommandOne.new().call
"Hello World!"
=> #<CommandOne:0x00007fc5eb59b498 @success=true, @options={:message=>"Hello World!"}, @data={:message=>"Hello World!"}>
irb(main):002:0> CommandOne.new(another_arg: 'value').call
"Hello World!"
=> #<CommandOne:0x00007fc5ee0a2628 @success=true, @options={:another_arg=>'value', :message=>"Hello World!"}, @data={:message=>"Hello World!"}>
```
