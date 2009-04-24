#
#  Rails application template I used to start the Famous weblog project
#


# Begin with a standard Rails project with RSpec and (optional) Cucumber support.
load_template "http://github.com/ck1/rails_templates/raw/master/rspec.rb"



# Ensure that required gems are in place.
gem "aasm", :lib => false
rake "gems:install", :sudo => true



# Install all necessary plugins.
plugin 'acts_as_taggable_on_steroids', :git => 'git://github.com/jviney/acts_as_taggable_on_steroids.git', :submodule => true
plugin 'attachment_fu', :git => 'git://github.com/technoweenie/attachment_fu.git', :submodule => true
plugin 'exception_notifier', :git => 'git://github.com/rails/exception_notification.git', :submodule => true
plugin 'permalink_fu', :git => 'git://github.com/technoweenie/permalink_fu.git', :submodule => true
#plugin 'responds_to_parent', :svn => 'http://responds-to-parent.googlecode.com/svn/trunk'
plugin 'responds_to_parent', :git => 'git://github.com/mislav/will_paginate.git', :submodule => true
plugin 'restful-authentication', :git => 'git://github.com/technoweenie/restful-authentication.git', :submodule => true
plugin 'role_requirement', :git => 'git://github.com/timcharper/role_requirement.git', :submodule => true
plugin 'tiny_mce_plus', :git => 'git://github.com/devon/tiny_mce_plus.git', :submodule => true
plugin 'will_paginate', :git => 'git://github.com/mislav/will_paginate.git', :submodule => true

rake "tiny_mce_plus:plugins"

generate "acts_as_taggable_migration"
generate "authenticated", "user session"
generate "roles", "Role User"
generate "tiny_mce_plus_migration"



# Propagate DB changes.
rake "db:migrate"
rake "db:test:clone"



# Update the Git repository.
git :add => "."
git :commit => "-m 'Set up critical gem dependencies, plugins for Famous weblog application'"
