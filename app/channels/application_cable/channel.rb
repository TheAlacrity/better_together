module ApplicationCable
  class Channel < ActionCable::Channel::Base   
    # identified_by :current_user

    #     def connect
    #       self.current_user = find_verified_user
    #     end

    #     private

    #     def find_verified_user
    #       if verified_user = env['warden'].user
    #         verified_user
    #       else
    #         logger.add_tags 'ActionCable', "The user is not found. Connection rejected."  
    #         reject_unauthorized_connection
    #       end
    #     end
    #   end
  end
end
