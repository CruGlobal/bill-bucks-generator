# Be sure to restart your server when you modify this file.
#
# This file eases your Rails 8.0 framework defaults upgrade.
#
# Uncomment each configuration one by one to switch to the new default.
# Once your application is ready to run with all new defaults, you can remove
# this file and set the `config.load_defaults` to `8.0`.
#
# Read the Guide for Upgrading Ruby on Rails for more info on each option.
# https://guides.rubyonrails.org/upgrading_ruby_on_rails.html

###
# Controls whether Active Record will use deprecated behavior where SQLite is not configured to have a strict strings mode.
# Rails 8.0 defaults to strict strings mode.
#++
# Rails.application.config.active_record.strict_strings_by_default = true

###
# Controls whether Active Job uses a serializer that can fall back to deserializing String
# instances of GlobalID::Identification objects. When set to :support_string_mode,
# Active Job will use GlobalIDSerializer(serializer: serializer, with_string_fallback: true).
# Rails 8.0 defaults to :support_string_mode.
#++
# Rails.application.config.active_job.global_id_serializer = :support_string_mode
