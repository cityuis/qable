begin
  require 'site_prism'

  SitePrism.configure do |config|
    config.use_implicit_waits = true
  end

  Dir.glob(File.join(Dir.pwd, 'page_objects', '**','*.rb')).each do |f|
    require f
  end

  module PageObjectsHelper
    def visit_page(name, args = {}, &block)
      build_page(name).tap do |page|
        page.load(args)
        block.call page if block
      end
    end

    def on_page(name, args = {}, &block)
      build_page(name).tap do |page|
        expected = page.class.to_s.sub(/PageObjects::/, '')
        expected += " (args: #{args})" if args.count > 0
        assert page.displayed?(args), "expected to be on page '#{expected}', but was on #{page.current_path}"
        block.call page if block
      end
    end

    def build_page(name)
      name = name.to_s.camelize if name.is_a? Symbol
      Object.const_get("#{name}").new
    end
  end

  World(PageObjectsHelper)
rescue LoadError
end
