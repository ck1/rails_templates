##                            ##
#   BASE RAILS PROJECT SETUP   #
##                            ##
# Remove default project files
run "rm README"
run "rm doc/README_FOR_APP"
run "rm public/index.html"
run "rm public/favicon.ico"
run "rm public/robots.txt"
run "rm -rf public/javascripts/*"

# Create databases
rake "db:create:all"

# Copy database.yml for distribution use
run "cp config/database.yml config/database.yml.example"



##                     ##
#   SETUP GIT SUPPORT   #
##                     ##
# Initialize a new Git repo
git :init


# Setup .gitignore
file ".gitignore", <<-END
.DS_Store
log/*.log
tmp/**/*
config/database.yml
db/*.sqlite3
doc/api
doc/app
nbproject/
END

# Ensure that key empty directories are picked up by Git
run "touch db/.gitignore log/.gitignore tmp/.gitignore"
run %{find . -type d -empty | grep -v "vendor" | grep -v ".git" | grep -v "tmp" | xargs -I xxx touch xxx/.gitignore}



##                ##
#   FINISH SETUP   #
##                ##
rake "db:migrate"
rake "db:test:clone"

git :add => "."
git :commit => "-m 'Initial commit (based on template basic_rails.rb)'"
