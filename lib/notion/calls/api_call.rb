# frozen_string_literal: true

module NotionClient
  module Calls
    class ApiCall
      def initialize
        @client = Notion::Client.new(token: ENV['NOTION_API_SECRET'])
      end

      def database_list
        @client.databases.list
      end

      def search
        @client.search({
                         query: 'Pessoal',
                         sort: {
                           direction: 'ascending',
                           timestamp: 'last_edited_time'
                         }
                       })
      end
    end
  end
end
