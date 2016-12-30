module ActionController
  class Responder
    # TODO: need to add merging with options
    def to_json
      if has_errors?
          controller.render json: resource.errors
      else
        controller.render json: resource
      end
    end

    # TODO: need to add merging with options
    def to_xml
      if has_errors?
        controller.render xml: resource.errors
      else
        controller.render xml: resource
      end
    end
  end
end