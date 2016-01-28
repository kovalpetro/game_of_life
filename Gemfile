source "https://rubygems.org"

ruby "2.2.3"

gem "minitest"
gem "rake"

group :development, :test do
  gem "pry"
  gem "byebug"
  gem "rubocop", require: false
  gem "rubocop-checkstyle_formatter", require: false
end

group :test do
  gem "ci_reporter_minitest"
end
