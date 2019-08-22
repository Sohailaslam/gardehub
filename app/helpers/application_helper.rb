module ApplicationHelper
    def is_active(c_name,m_name)
        (controller_name == c_name and action_name == m_name) ? "active" : ""
    end

    def resource_name
        :user
    end

    def resource
     @resource ||= User.new
    end

    def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
    end
end
