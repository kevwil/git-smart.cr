require "spec"
require "stdio"

require "./../lib/git-smart"

WORKING_DIR = "./working"

Spec.before_each do
  FileUtils.rm_rf WORKING_DIR
  FileUtils.mkdir_p WORKING_DIR
end

Spec.after_each do
  FileUtils.rm_rf WORKING_DIR
end

def run_command(dir, command, *args)
  stdout, stderr, stdin = Stdio.capture do |io|

    Dir.chdir(dir) { GitSmart.run(command, args) }

    [io.out.gets, io.err.gets, io.in.gets]
  end
  stout.string.split("\n")
end

# RSpec::Matchers.define :report do |expected|
#   failure_message_for_should do |actual|
#     "expected to see #{expected.inspect}, got \n\n#{actual.map { |line| "  #{line}" }.join("\n")}"
#   end
#   failure_message_for_should_not do |actual|
#     "expected not to see #{expected.inspect} in \n\n#{actual.map { |line| "  #{line}" }.join("\n")}"
#   end
#   match do |actual|
#     actual.any? { |line| line[expected] }
#   end
# end


# RSpec::Matchers.define :have_git_status do |expected|
#   failure_message_for_should do |dir|
#     "expected '#{dir}' to have git status of #{expected.inspect}, got #{GitRepo.new(dir).status.inspect}"
#   end
#   failure_message_for_should_not do |actual|
#     "expected '#{dir}' to not have git status of #{expected.inspect}, got #{GitRepo.new(dir).status.inspect}"
#   end
#   match do |dir|
#     GitRepo.new(dir).status == expected
#   end
# end


# RSpec::Matchers.define :have_last_few_commits do |expected|
#   failure_message_for_should do |dir|
#     "expected '#{dir}' to have last few commits of #{expected.inspect}, got #{GitRepo.new(dir).last_commit_messages(expected.length).inspect}"
#   end
#   failure_message_for_should_not do |actual|
#     "expected '#{dir}' to not have git status of #{expected.inspect}, got #{GitRepo.new(dir).last_commit_messages(expected.length).inspect}"
#   end
#   match do |dir|
#     GitRepo.new(dir).last_commit_messages(expected.length) == expected
#   end
# end
