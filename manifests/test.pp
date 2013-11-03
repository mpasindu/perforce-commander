class perforce-commander::test{
exec { "whatever":
  provider => shell,
  command => "echo pasindu"
}
}
