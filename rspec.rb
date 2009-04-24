##                            ##
#   BASE RAILS PROJECT SETUP   #
##                            ##
load_template "http://github.com/ck1/rails_templates/raw/master/basic.rb"


##                    ##
#   GEMS AND PLUGINS   #
##                    ##
gem "rspec", :lib => false
plugin 'rspec-rails', :git => 'git://github.com/dchelimsky/rspec-rails.git'
generate "rspec"

if cucumber_support = yes?("Do you also want to bake in Cucumber support?")
  gem "cucumber", :lib => false
  gem "webrat", :lib => false
  generate "cucumber"
end

##                  ##
#    FINISH SETUP    #
##                  ##
run %{find . -type d -empty | grep -v "vendor" | grep -v ".git" | grep -v "tmp" | xargs -I xxx touch xxx/.gitignore}
git :add => "."
testing_stack = (cucumber_support ? "RSpec and Cucumber" : "RSpec")
git :commit => "-m 'Added #{ testing_stack  } support'"
