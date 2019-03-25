class MessagesController < ApplicationController

    def create
        message = Message.create(message_params)
        occasion = Occasion.find(message.occasion_id)
        redirect_to occasion_path(occasion)        
    end

    private
    def message_params
        params.require(:message).permit(:content, :user_id, :occasion_id)
    end
    
end
