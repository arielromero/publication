# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8

# my_date_formats = { :default => '%d/%m/%Y' } 

# ActiveSupport::CoreExtensions::Time::Conversions::DATE_FORMATS.merge!(my_date_formats) 

# ActiveSupport::CoreExtensions::Date::Conversions::DATE_FORMATS.merge!(my_date_formats)
Publication::Application.initialize!
