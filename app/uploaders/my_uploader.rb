class MyUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  def cache_dir
    '/tmp/cache'
  end
  def extension_whitelist
    %w(srt)
  end
end