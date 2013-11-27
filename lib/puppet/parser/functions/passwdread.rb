module Puppet::Parser::Functions
      newfunction(:passwdread, :type => :rvalue) do |args|
	      file = File.open("/root/.p4/p4", "rb")
	      contents = file.read.chop!
      end
    end
