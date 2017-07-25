require 'hirb'
Hirb.enable
extend Hirb::Console

Hirb.enable pager: true
Pry.config.pager = true
Pry.config.history.file = '.pry_history'
