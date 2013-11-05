Facter.add("p4pw") do
	setcode do
		Facter::Util::Resolution.exec('/bin/cat /.p4')
	end
end
