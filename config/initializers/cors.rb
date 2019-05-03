Rails.application.config.middleware.insert_before 0, Rack::Cors do
allow do
    origins '*'

    resource '*',
        :headers: :any,
        :expose => ['access-token, 'expiry', ' toke-type', 'vid', 'client']
        :methods => [:get, :post, :put, :delete, :options,]
  end
end
