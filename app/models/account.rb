# app/models/account.rb
class Account < ApplicationRecord
  validates :subdomain, presence: true, uniqueness: true
end