###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  activate :asset_hash

  # Use relative URLs
  activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end

set :haml, :format => :html5
activate :bower

require 'pathname'

bower_dir = 'vendor/assets/bower/'
%w(font-source-sans-pro-compass/*/*).each do |pattern|
  Dir[bower_dir + pattern].each do |font|
    sprockets.import_asset Pathname.new(font).relative_path_from(
      Pathname.new(bower_dir))
  end
end

activate :blog do |blog|
  # set options on blog
  blog.default_extension = '.haml'
  blog.day_link = '/{year}/{month}/{day}/index.html'
  blog.month_link = '/{year}/{month}/index.html'
  blog.year_link = '/{year}/index.html'
  blog.taglink = '/tags/{tag}/index.html'
  blog.permalink = '/{title}/index.html'
  blog.sources = '/{title}.html'
  blog.layout = 'works-show'
  blog.prefix = '/works'
  blog.new_article_template = 'source/layouts/work.tt'
end
