module Qable
  module Generators
    module App
      class AppGenerator < Thor::Group
        include Thor::Actions

        argument :name

        def self.source_root
          File.dirname(__FILE__)
        end

        def create_base_dir
          self.destination_root = File.expand_path(name, destination_root)
          empty_directory '.'
          inside destination_root do
            create_gemfile
            create_rakefile
            create_config
            create_gitignore
            create_features_directory
            run_bundle
          end
        end

        private

          def create_gemfile
            template('templates/Gemfile', 'Gemfile')
          end

          def create_rakefile
            template('templates/Rakefile', 'Rakefile')
          end

          def create_config
            template('templates/config.yml', 'config.yml')
          end

          def create_gitignore
            template('templates/gitignore', '.gitignore')
          end

          def create_features_directory
            directory('templates/features', 'features')
          end

          def run_bundle
            run 'bundle install'
          end
      end
    end
  end
end
