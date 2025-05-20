class SolidQueueJob < ApplicationRecord
  self.table_name = "solid_queue_jobs"

  store_accessor :arguments, :custom_key
end
