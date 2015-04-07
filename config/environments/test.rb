Rails.application.configure do
  config.cache_classes = true
  config.eager_load = false
  config.serve_static_assets = true
  config.static_cache_control = "public, max-age=3600"
  config.consider_all_requests_local = true
  config.action_controller.perform_caching = false
  config.action_dispatch.show_exceptions = false
  config.action_controller.allow_forgery_protection = false
  config.action_mailer.delivery_method = :test
  config.action_mailer.default_url_options = { only_path: true }
  config.active_support.deprecation = :stderr
  config.allow_concurrency = false
end
