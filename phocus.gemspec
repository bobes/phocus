Gem::Specification.new do |s|
  s.name                = "phocus"
  s.summary             = "Focus your tests"
  s.description         = "Focus your tests."
  s.author              = "mynyml"
  s.email               = "mynyml@gmail.com"
  s.homepage            = "http://mynyml.com/ruby/focused-tests-with-phocus"
  s.rubyforge_project   = "phocus"
  s.require_path        = "lib"
  s.bindir              = "bin"
  s.version             =  "1.2"
  s.files               =  `git ls-files`.strip.split("\n")

  s.add_development_dependency 'citrusbyte-contest'
  s.add_development_dependency 'jeremymcanally-context'
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'nanotest'
  s.add_development_dependency 'thoughtbot-shoulda'
end
