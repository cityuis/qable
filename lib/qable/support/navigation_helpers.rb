module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition
  #
  def path_to(page_name)
    case page_name

    when /^the home\s?page$/
      '/'

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    when /^the (.*) page$/
      path_name = $1.split(/\s+/).join('_')
      paths = YAML.load_file(File.join(Dir.pwd, "config.yml"))["paths"]
      if path = paths[path_name]
        path
      else
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in config.yaml"
      end
    else
      page_name
    end
  end
end

World(NavigationHelpers)
