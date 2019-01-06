require_relative "production"

Mail.register_interceptor(
  RecipientInterceptor.new(ENV.fetch("EMAIL_RECIPIENTS"), subject_prefix: '[STAGING]')
)

Rails.application.configure do
  config.action_mailer.default_url_options = { host: 'staging.test_app.com' }

    # Use S3 in Staging
  config.paperclip_defaults = {
    storage: :s3,
    url: ":s3_domain_url",
    path: "/:class/:attachment/:id_partition/:style/:filename",
    bucket: ENV['S3_BUCKET_NAME'],
    s3_credentials: {
      access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
    },
    s3_region: ENV['AWS_REGION']
  }
  # config.action_controller.asset_host = "d2wn8dbvd7ovdn.cloudfront.net"
end
