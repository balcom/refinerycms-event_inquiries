Gem::Specification.new do |s|
  s.name              = %q{refinerycms-event_inquiries}
  s.version           = %q{0.9.9.9}
  s.date              = %q{2011-02-11}
  s.summary           = %q{EventInquiry handling functionality for the Refinery CMS project.}
  s.description       = %q{EventInquiry handling functionality extracted from Refinery CMS to allow you to have a contact form and manage event_inquiries in the Refinery backend.}
  s.homepage          = %q{http://refinerycms.com}
  s.email             = %q{info@refinerycms.com}
  s.authors           = ["Resolve Digital"]
  s.require_paths     = %w(lib)

  s.files             = [
    'app',
    'app/controllers',
    'app/controllers/admin',
    'app/controllers/admin/event_inquiries_controller.rb',
    'app/controllers/admin/event_inquiry_settings_controller.rb',
    'app/controllers/event_inquiries_controller.rb',
    'app/helpers',
    'app/helpers/event_inquiries_helper.rb',
    'app/mailers',
    'app/mailers/event_inquiry_mailer.rb',
    'app/models',
    'app/models/event_inquiry.rb',
    'app/models/event_inquiry_setting.rb',
    'app/views',
    'app/views/admin',
    'app/views/admin/event_inquiries',
    'app/views/admin/event_inquiries/_event_inquiry.html.erb',
    'app/views/admin/event_inquiries/_submenu.html.erb',
    'app/views/admin/event_inquiries/index.html.erb',
    'app/views/admin/event_inquiries/show.html.erb',
    'app/views/admin/event_inquiry_settings',
    'app/views/admin/event_inquiry_settings/_confirmation_email_form.html.erb',
    'app/views/admin/event_inquiry_settings/_notification_recipients_form.html.erb',
    'app/views/admin/event_inquiry_settings/edit.html.erb',
    'app/views/event_inquiries',
    'app/views/event_inquiries/new.html.erb',
    'app/views/event_inquiries/thank_you.html.erb',
    'app/views/event_inquiry_mailer',
    'app/views/event_inquiry_mailer/confirmation.html.erb',
    'app/views/event_inquiry_mailer/notification.html.erb',
    'config',
    'config/locales',
    'config/locales/da.yml',
    'config/locales/de.yml',
    'config/locales/en.yml',
    'config/locales/es.yml',
    'config/locales/fr.yml',
    'config/locales/it.yml',
    'config/locales/lolcat.yml',
    'config/locales/lt.yml',
    'config/locales/lv.yml',
    'config/locales/nb.yml',
    'config/locales/nl.yml',
    'config/locales/pl.yml',
    'config/locales/pt-BR.yml',
    'config/locales/ru.yml',
    'config/locales/sl.yml',
    'config/locales/sv.yml',
    'config/routes.rb',
    'db',
    'db/migrate',
    'db/migrate/20110211103100_create_event_inquiries.rb',
    'db/migrate/20110211103101_remove_position_and_open_from_event_inquiries.rb',
    'db/seeds',
    'db/seeds/pages_for_event_inquiries.rb',
    'features',
    'features/create_event_inquiries.feature',
    'features/manage_event_inquiries.feature',
    'features/step_definitions',
    'features/step_definitions/event_inquiry_steps.rb',
    'features/support',
    'features/support/factories.rb',
    'features/support/paths.rb',
    'lib',
    'lib/event_inquiries.rb',
    'lib/gemspec.rb',
    'lib/generators',
    'lib/generators/refinerycms_event_inquiries_generator.rb',
    'lib/refinerycms-event_inquiries.rb',
    'license.md',
    'readme.md',
    'refinerycms-event_inquiries.gemspec',
    'spec',
    'spec/models',
    'spec/models/event_inquiry_spec.rb'
  ]
  s.require_path = 'lib'

  s.add_dependency('filters_spam', '~> 0.2')
end
