Facter.add("p4pw") do
	setcode do
		Facter::Util::Resolution.exec('/bin/cat /root/.p4/p4')
	end
end
