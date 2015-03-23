class TinymceAssetsController < ApplicationController
  def create
    document = Document.create(document_params)

    render json: {
      document: {
        url: document.file.url,
        title: document.title
      }
    }, layout: false, content_type: "text/html"
  end
  
  private
  
    def document_params
      params.require(:document).permit(:file, :title)
    end
end
