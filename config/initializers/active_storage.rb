Rails.application.config.after_initialize do
  ActiveStorage::Blob.after_destroy_commit do
    ActiveStorage::Blob.service.delete(key) if key.present?
  end
end
