class SearchController < ApplicationController
    def search_message
        @messages = params[:q].present? ? Message.search(params[:q]) : Message.all
        render json: { data: @messages}
    end
end
