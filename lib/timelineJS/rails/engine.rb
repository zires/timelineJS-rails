module TimelineJS
  module Rails
    class Engine < ::Rails::Engine

      initializer 'timelineJS.environment', group: :all do |app|
        config = app.config

        ActiveSupport.on_load(:action_view) do
          include TimelineJS::Rails::Helper
        end

        config.assets.precompile += %w(
          timelineJS.js
          css/timeline.css
          css/themes/dark.css
          js/timeline-min.js
        )
      end

    end
  end
end
