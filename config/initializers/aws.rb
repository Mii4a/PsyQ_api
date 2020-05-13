unless Rails.env.test? || Rails.env.development?
  credentials = Aws::Credentials.new(
    ENV['S3_ACCESS_KEY_ID'],
    ENV['S3_SERCRET_ACCESS_KEY']
  )

  s3_resource = Aws::S3::Resource.new(region: ENV['AWS_DEFAULT_REGION'], credentials: credentials)
  S3_BUCKET = s3_resource.bucket(ENV['AWS_BUCKET'])
end
