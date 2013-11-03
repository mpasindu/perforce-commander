Facter.add("home") do
  setcode do
    Facter::Util::Resolution.exec('/bin/echo $HOME')
  end
end

