module SuggestedProducts
    extend ActiveSupport::Concern
   
    private

    def set_suggested_products
        @suggested_products = Product.all - [@product]
    end
end