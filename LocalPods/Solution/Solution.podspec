Pod::Spec.new do |s|
  s.name             = 'Solution'
  s.version          = '0.1.0'
  s.summary          = 'Solution'

  s.homepage         = 'Local'
  s.authors          = 'tinkoff.student'
  s.source           = { :path => '*' }

  s.ios.deployment_target = '15.0'
  s.static_framework = true
  s.module_map = false

  # Resources

  resources_bundle_name = "#{s.name}Resources"

  resources = [
    "#{s.name}/Resources/Assets/**/*.{xcassets}",
    "#{s.name}/Resources/Localization/**/*.{strings,stringsdict}"
  ]

  s.resource_bundles = {
    resources_bundle_name => resources
  }

  # Sources

  s.source_files = [
    'Solution/Classes/**/*.{swift}'
  ]

  s.dependency 'ProdMobileCore'

end

