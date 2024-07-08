# The context that commands get executed within. Used for defining and scoping helper methods.

require "colorize"

class ExecutionContext
  # def initialize
  # end

  def start(msg)
    !p "- #{msg} -".green
  end

  def note(msg)
    !p "* #{msg}"
  end

  def warn(msg)
    !p msg.red
  end

  def puts_with_done(msg, &blk)
    print "#{msg}..."
    blk.call
    !p "done."
  end

  def success(msg)
    !p big_message(msg).green
  end

  def failure(msg)
    !p big_message(msg).red
    raise GitSmart::RunFailed
  end

  def big_message(msg)
    spacer_line = (" " + "-" * (msg.length + 20) + " ")
    [spacer_line, "|" + " " * 10 + msg + " " * 10 + "|", spacer_line].join("\n")
  end
end
