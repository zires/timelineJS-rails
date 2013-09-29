module TimelineJS
  module Rails
    class Engine < ::Rails::Engine

      initializer 'timelineJS.environment', group: :all do |app|
        config = app.config

        ActiveSupport.on_load(:action_view) do
          include TimelineJS::Rails::Helper
        end

        config.assets.precompile += %w(
          timelineJS/timelineJS.js
          timelineJS/timeline.css
          timelineJS/timeline-min.js
          timelineJS/themes/dark.css
        )
      end

    end
  end
end
