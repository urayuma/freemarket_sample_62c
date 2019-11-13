require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FreemarketSample62c
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.i18n.default_locale = :ja
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.yml').to_s]

    # from_forタグがエラーメッセージがるときに自動で作成する<div class="form_with_erroro></div>"を作成させないために
    config.action_view.field_error_proc = proc { |html_tag, _instance| html_tag }
    config.generators do |g|
      g.assets false # CSS/JSファイル生成せず
      g.skip_routes false        # trueなら routes.rb変更せず
      g.helper false             # ヘルパー生成せず
      g.test_framework :rspec,   # テストフレームワークはrspecを使用の場合
                       view_specs: false,
                       helper_specs: false,
                       routing_specs: false,
                       controller_specs: false,
                       request_specs: false,
                       fixtures: true
      g.fixture_replacement :factory_bot, dir: "spec/factories" # fixtureはfactory_botでディレクトリを変更
    end
  end
end
