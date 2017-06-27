module Onebox
  module Engine
    class BilibiliOnebox
      include Engine
      include HTML

      matches_regexp(/^https?:\/\/(?:www\.)?bilibili\.com\/video\/([a-z0-9]+)\/?$/)

      # Try to get the video ID. Works for URLs of the form:
      # * http://www.bilibili.com/video/av4235068/
      def video_id
        match = uri.path.match(/\/video\/av(\d+)(\.html)?.*/)
        return match[1] if match && match[1]

        nil
      rescue
        return nil
      end

      def to_html
        "<embed height='415' width='544' quality='high' allowfullscreen='true' type='application/x-shockwave-flash' src='//static.hdslb.com/miniloader.swf' flashvars='aid=#{video_id}&page=1' pluginspage='//www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash'></embed>"
      end

      def placeholder_html
        to_html
      end
    end
  end
end
