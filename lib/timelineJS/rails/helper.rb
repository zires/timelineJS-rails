module TimelineJS
  module Rails
    module Helper

      # https://github.com/NUKnightLab/TimelineJS#using-inline-easiest
      # @example
      #   <%= timeline_config(embed_id: 'my-timeline', source: 'path_to_json/or_link_to_googlespreadsheet') %>
      def timeline_config(options = {})
        turbolink = options.delete(:turbolink)
        turbolink = turbolink.nil? ? true : turbolink
        output = "<div id='#{options[:embed_id]}'></div>"
        output << javascript_tag("var timeline_config = #{default_timelinejs_options.merge(options).to_json};")
        output << javascript_include_tag('timelineJS', 'data-turbolinks-track' => turbolink)
        raw(output)
      end

      # https://github.com/NUKnightLab/TimelineJS#using-a-method-advanced
      # @example
      #   <%= create_storyJS('my-timeline', source: 'path_to_json/or_link_to_googlespreadsheet') %>
      def create_storyJS(embed_id, options = {})
        options[:embed_id] = embed_id
        options[:type]     = 'timeline' unless options[:type]
        turbolink          = options.delete(:turbolink)
        turbolink          = turbolink.nil? ? true : turbolink
        output =  javascript_include_tag('timelineJS', 'data-turbolinks-track' => turbolink)
        output << javascript_tag do
          <<-SCRIPT
            $(document).ready(function() {
              createStoryJS(#{ default_timelinejs_options.merge(options).to_json });
            });
          SCRIPT
        end
        raw(output)
      end

      protected

        def default_timelinejs_options
          {
            width: '100%',
            height: '600',
            css: stylesheet_path('timelineJS/timeline'),
            js: javascript_path('timelineJS/timeline-min')
          }
        end

    end
  end
end
