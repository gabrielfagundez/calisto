class EstimatesController < ActionController::Base

  def index
    url = URI.parse('http://localhost:8080/api/pending_estimates.json')
    req = Net::HTTP::Get.new(url.path)
    res = Net::HTTP.start(url.host, url.port) do |http|
      http.request(req)
    end
    @pending = JSON.parse(res.body)
  end
end