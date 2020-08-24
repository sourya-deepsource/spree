module Spree
  module PromotionHandler
    class Page
      attr_reader :order, :path

      def initialize(order, path)
        @order = order
        @path = path.delete_prefix("/")
      end

      def activate
        if promotion&.eligible?(order)
          promotion.activate(order: order)
        end
      end

      private

      def promotion
        @promotion ||= Promotion.active.find_by(path: path)
      end
    end
  end
end
