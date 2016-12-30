module ActionController
  class Responder
    # TODO: need to add merging with options
    def to_json
      controller.render json: resource
    end

    # TODO: need to add merging with options
    def to_xml
      controller.render xml: resource
    end
  end
end