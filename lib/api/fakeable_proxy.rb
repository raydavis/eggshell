module Fakeable_Proxy

  VCR.configure do |c|
    c.cassette_library_dir = 'fixtures/fakeable_proxy_data'
    c.hook_into :fakeweb
    c.allow_http_connections_when_no_cassette = true
    c.debug_logger = File.open(Rails.root.join("log", "vcr-debug.log"), 'w')
    c.after_http_request do |request,response|
      # so we don't record sensitive auth headers
      response.headers['authorization'] = ''
      request.headers['authorization'] = ''
    end
  end

  def fake?(fake_prefix_param)
    fake_prefix_param == 'fake' || Settings.canvas_proxy.fake
  end

  def do_get(request_id, url, headers = {}, force_fake = nil)
    make_request(request_id, force_fake) do
      RestClient.get(url, {
        :accept_encoding => ''
      }.merge!(headers))
    end
  end

  def make_request(request_id, force_fake = nil, &block)
    if force_fake || Settings.freshen_vcr
      p "Using VCR to wrap request id #{request_id}"
      VCR.use_cassette(request_id,
                       :allow_playback_repeats => true,
                       :match_requests_on => [:method, :path],
                       :serialize_with => :json,
                       :preserve_exact_body_bytes => false) do
        block.call
      end
    else
      block.call
    end
  end

end
