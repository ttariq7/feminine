CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id      => 'AKIAJMIR27U4DN7S4JSQ',       # required
    :aws_secret_access_key  => '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',       # required

  }
  config.fog_directory  = 'femynyn.images'                     # required

  config.cache_dir = "#{Rails.root}/tmp/uploads"

end