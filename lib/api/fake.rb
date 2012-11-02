module Api
  class Fake < Sinatra::Base

    fake_root = "/fake/api"

    def self.read_json(path_segments)
      path_segments[-1] = "#{path_segments[-1]}.json"
      path = File.join(File.dirname(__FILE__), '..', 'fake_data', path_segments)
      p "Path = #{path}"
      File.read(path)
    end

    get "#{fake_root}/*" do
      Api::Fake.read_json params[:splat]
    end

  end
end
