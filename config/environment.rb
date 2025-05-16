# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.stmp_settings = {
  address: ENV.fetch("SMTP_ADDRESS", "smtp.sendgrid.net"),
  port: ENV.fetch("SMTP_PORT", "587"),
  authentication: ENV.fetch("SMTP_AUTHENTICATION", "plain"),
  domain: ENV.fetch("SMTP_DOMAIN", "heroku.com"),
  enable_starttls_auto: true,
  user_name: ENV.fetch("SMTP_USERNAME"),
  password: ENV.fetch("SMTP_PASSWORD")
}.freeze