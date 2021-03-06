require 'rake/rdoctask'

# --------------------------------------------------
# Gem
# --------------------------------------------------
def gemspec
  @gemspec ||= Gem::Specification.new do |s|
    s.name                = "phocus"
    s.summary             = "Run focused tests"
    s.description         = "Tell test/unit exactly which tests you want run. It will ignore all the other ones and let you concentrate on a few."
    s.author              = "Martin Aumont"
    s.email               = "mynyml@gmail.com"
    s.homepage            = "http://github.com/mynyml/watchr"
    s.rubyforge_project   = "phocus"
    s.has_rdoc            =  true
    s.require_path        = "lib"
    s.version             = "1.1"
    s.files               =  File.read("Manifest").strip.split("\n")

    s.add_development_dependency 'nanotest'
    s.add_development_dependency 'minitest'
    s.add_development_dependency 'thoughtbot-shoulda'
    s.add_development_dependency 'citrusbyte-contest'
    s.add_development_dependency 'jeremymcanally-context'
  end
end

desc "Create a Ruby GEM package with the given name and version."
task(:gem) do
  file = Gem::Builder.new(gemspec).build
  FileUtils.mv file, "pkg/#{file}", :verbose => true
end

desc "Create gemspec file"
task(:gemspec) do
  open("#{gemspec.name}.gemspec", 'w') {|f| f << YAML.dump(gemspec) }
end

# --------------------------------------------------
# Tests
# --------------------------------------------------
namespace(:test) do

  desc "run framework compatibility tests"
  task(:all) do
    paths = %w(
      test/compat/test_contest.rb
      test/compat/test_context.rb
      test/compat/test_minitest.rb
      test/compat/test_shoulda.rb
      test/compat/test_test_unit.rb
      test/test_phocus.rb
    )
    paths.each do |path|
      cmd = "ruby -rubygems -I.:lib #{path}"
      puts(cmd) if ENV['VERBOSE']
      system(cmd)
    end
  end

  desc "Run all tests on multiple ruby versions (requires rvm)"
  task(:portability) do
    versions = %w(  1.8.6  1.8.7  1.9  1.9.2  jruby  )
    versions.each do |version|
      system <<-BASH
        bash -c 'source ~/.rvm/scripts/rvm;
                 rvm use #{version};
                 echo "--------- #{version} ----------\n";
                 rake -s test:all'
      BASH
    end
  end
end

# --------------------------------------------------
# Docs
# --------------------------------------------------
desc "Generate rdoc documentation."
Rake::RDocTask.new(:rdoc => 'rdoc', :clobber_rdoc => 'rdoc:clean', :rerdoc => 'rdoc:force') do |rdoc|
  rdoc.rdoc_dir = 'doc/rdoc'
  rdoc.title    = 'Phocus'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.options << '--charset' << 'utf-8'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('LICENSE')
  rdoc.rdoc_files.include('VERSION')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

