Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://task-manager-leo-898e46902197.herokuapp.com/'
    resource 'https://task-manager-leo-898e46902197.herokuapp.com/',
             headers: :any,
             methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
