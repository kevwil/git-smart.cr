class GitSmart
  def self.run(code, args)
    lambda = commands[code]
    if lambda
      begin
        lambda.call(args)
      rescue e : GitSmart::Exception
        if e.message && !e.message.empty?
          !p e.message.red
        end
      end
    else
      !p "No command #{code.inspect} defined! Available commands are #{commands.keys.sort.inspect}"
    end
  end

  # Used like this:
  # GitSmart.register 'my-command' do |repo, args|
  def self.register(code, &blk)
    commands[code] = Proc(args: Array(String)) {
      with ExecutionContext.new yield [GitRepo.new("."), args, &blk]
    }
  end

  def self.commands
    @@commands ||= Hash.new
  end
end
