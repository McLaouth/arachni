=begin
                  Arachni
  Copyright (c) 2010-2011 Tasos "Zapotek" Laskos <tasos.laskos@gmail.com>

  This is free software; you can copy and distribute and modify
  this program under the term of the GPL v2.0 License
  (See LICENSE file for details)

=end

module Arachni

require Arachni::Options.instance.dir['reports'] + '/xml/buffer.rb'

module Reports

class XML
module PluginFormatters

class MetaModules

module MetaFormatters

    #
    # XML formatter for the results of the TimeoutNotice metamodule
    #
    # @author: Tasos "Zapotek" Laskos
    #                                      <tasos.laskos@gmail.com>
    #                                      <zapotek@segfault.gr>
    # @version: 0.1
    #
    class TimeoutNotice < Arachni::Plugin::Formatter

        include Arachni::Reports::Buffer

        def initialize( metadata )
            @results     = metadata[:results]
            @description = metadata[:description]
        end

        def run
            start_tag( 'timeout_notice' )
            simple_tag( 'description', @description )
            start_tag( 'results' )

            @results.each { |issue| add_issue( issue ) }

            end_tag( 'results' )
            end_tag( 'timeout_notice' )
        end

        def add_issue( issue )
            __buffer( "<issue index=\"#{issue['index'].to_s}\" name=\"#{issue['name']}\"" +
                " url=\"#{issue['url']}\" element=\"#{issue['elem']}\" " +
                " variable=\"#{issue['var']}\" method=\"#{issue['method']}\" />" )
        end

    end

end

end
end
end
end
end
