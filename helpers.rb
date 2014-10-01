module Uber
  module Helpers
    def protected!(message = "Login first")
      return true if authorized?
      flash[:error] = message
      redirect to('/login')
    end

    def authorized?
      !!session[:user_id]
    end

    def logout!
      session[:name]    = nil
      session[:email]   = nil
      session[:user_id] = nil
      session[:token]   = nil
    end

    def login!(omniauth)
      session[:name]    = name(omniauth['info'])
      session[:email]   = omniauth['info']['email']
      session[:user_id] = omniauth['uid']
      session[:token]   = omniauth['credentials']['token']
    end

    def name(info)
      info['first_name'] + " " + info['last_name']
    end

    def login_link_with(provider)
      "/auth/#{provider}"
    end

    def trip_time(trip)
      prefix = Time.at(trip["start_time"]).strftime("%a %e. %l:%M %p")
      suffix = Time.at(trip["end_time"]).strftime("%l:%M %p")
      "#{prefix} to #{suffix}"
    end

    def timeline_class_for(index)
      index.even? ? "" : "timeline-inverted"
    end
  end
end
