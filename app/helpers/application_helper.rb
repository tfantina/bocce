module ApplicationHelper

    def devise_mapping
      @devise_mapping ||= Devise.mappings[:user]
    end

    def truncate_username(user)
        @first_name = user.scan(/\A[a-zA-Z]+/).first
        return @first_name
    end


end
