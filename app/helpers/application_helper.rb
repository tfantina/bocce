module ApplicationHelper

    def truncate_username(user)
        @first_name = user.scan(/\A[a-zA-Z]+/).first
        return @first_name
    end
end
