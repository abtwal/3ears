source 'https://rubygems.org'

ruby '2.6.2'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

group :development do
  gem 'capistrano',      require: false
  gem 'capistrano-nvm',  require: false
  gem 'capistrano-yarn', require: false
end
