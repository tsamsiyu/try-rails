class ContentTypeFilter
  def self.before(controller)
    request = controller.request
    if request.headers['Content-Type'] == 'application/json'
      request.format = :json
    elsif request.headers['Content-Type'] == 'application/xml'
      request.format = :xml
    end
  end
end