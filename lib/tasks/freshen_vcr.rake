if ENV['freshen_vcr']
  p "Deleting old VCR cassette files from fixtures/fakeable_proxy_data"
  FileUtils.rm_rf(Rails.root.join("fixtures", "fakeable_proxy_data"), :secure => true)
end
